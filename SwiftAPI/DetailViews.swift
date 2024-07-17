import Foundation
import SwiftUI

struct StarshipDetailView: View {
    let starship: Starship
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Model: \(starship.model)")
            Text("Manufacturer: \(starship.manufacturer)")
            Text("Cost in credits: \(starship.cost_in_credits)")
            Text("Length: \(starship.length)")
            Text("Hyper drive rating: \(starship.hyperdrive_rating)")
            Spacer()
        }
        .padding()
        .navigationTitle(starship.name)
    }
}

struct PersonDetailView: View {
    let person: Person
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Height: \(person.height)")
            Text("Mass: \(person.mass)")
            Text("Skin color: \(person.skin_color)")
            Text("Eye color: \(person.eye_color)")
            Text("Birth year: \(person.birth_year)")
            Text("Gender: \(person.gender)")
            
            Spacer()
        }
        .padding()
        .navigationTitle(person.name)
    }
}

struct PlanetDetailView: View {
    let planet: Planet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Climate: \(planet.climate)")
            Text("Population: \(planet.population)")
            Text("Orbital period: \(planet.orbital_period)")
            Text("Diameter: \(planet.diameter)")
            Text("Climate: \(planet.climate)")
            Text("Gravity: \(planet.gravity)")
            Text("Terrain: \(planet.terrain)")
            Text("Population: \(planet.population)")
            Text("Residents: \(planet.residents)")
            Spacer()
        }
        .padding()
        .navigationTitle(planet.name)
    }
}
