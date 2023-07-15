// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let place = try? JSONDecoder().decode(Place.self, from: jsonData)

import Foundation

// MARK: - Place
struct Place: Codable {
    let type: String?
    let features: [Feature]?
}

// MARK: - Feature
struct Feature: Codable {
    let type: String?
    let properties: Properties?
    let geometry: Geometry?
}

// MARK: - Properties
struct Properties: Codable {
    let name: String?
    let country: String?
    let countryCode: String?
    let state: String?
    let county: String?
    let city, town, postcode, suburb: String?
    let street: String?
    let lon, lat: Double?
    let formatted, addressLine1, addressLine2: String?
    let categories: [String]?
    let distance: Int?
    let place_id, quarter, district, neighbourhood: String?
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String?
    let coordinates: [Double]?
}

