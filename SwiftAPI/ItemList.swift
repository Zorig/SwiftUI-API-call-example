import Foundation
import SwiftUI

struct ItemListView<T: Codable & Identifiable & Hashable, Content: View>: View {
    @ObservedObject var viewModel: GenericViewModel<T>
    let content: (T) -> Content
    let urlString: String
    let title: String
    let name: (T) -> String
    
    var body: some View {
        NavigationView {
            List(viewModel.items, id: \.self) { item in
                NavigationLink(destination: content(item)) {
                    Text(name(item)).bold().padding(3)
                        .onAppear {
                            viewModel.loadMoreIfNeeded(currentItem: item)
                        }
                }
            }
            .navigationTitle(title)
            .onAppear {
                viewModel.fetch(urlString: urlString)
            }
        }
    }
}
