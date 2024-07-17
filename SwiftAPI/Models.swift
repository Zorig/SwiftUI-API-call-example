import Foundation

struct Starship: Hashable, Codable, Identifiable {
    var id: String {name}
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let hyperdrive_rating: String
}

struct Person: Hashable, Codable, Identifiable {
    var id: String {name}
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
}

struct Planet: Hashable, Codable, Identifiable {
    var id: String {name}
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String?]
}
