import Foundation
import SwiftUI
import Combine

struct APIResponse<T: Codable>: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [T]
}

class GenericViewModel<T: Codable & Identifiable>: ObservableObject {
    @Published var items: [T] = []
    private var cancellable: AnyCancellable?
    private var nextPageURL: String?

    func fetch(urlString: String) {
        guard let url = URL(string: urlString) else { return }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: APIResponse<T>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { response in
                self.items.append(contentsOf: response.results)
                self.nextPageURL = response.next
            })
    }

    func loadMoreIfNeeded(currentItem: T) {
        guard let urlString = nextPageURL else { return }

        if let index = items.firstIndex(where: { $0.id == currentItem.id }), index >= items.count - 1 {
            fetch(urlString: urlString)
        }
    }
}
