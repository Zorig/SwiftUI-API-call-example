import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ItemListView(viewModel: GenericViewModel<Starship>(), content: { starship in
                StarshipDetailView(starship: starship)
            }, urlString: "https://swapi.dev/api/starships", title: "Starships", name: { $0.name })
                .tabItem {
                    Label("Starships", systemImage: "airplane")
                }
            
            ItemListView(viewModel: GenericViewModel<Person>(), content: { person in
                PersonDetailView(person: person)
            }, urlString: "https://swapi.dev/api/people", title: "People", name: { $0.name })
                .tabItem {
                    Label("People", systemImage: "person.2")
                }
            
            ItemListView(viewModel: GenericViewModel<Planet>(), content: { planet in
                PlanetDetailView(planet: planet)
            }, urlString: "https://swapi.dev/api/planets", title: "Planets", name: { $0.name })
                .tabItem {
                    Label("Planets", systemImage: "globe")
                }
        }
    }
}

#Preview {
    ContentView()
}

