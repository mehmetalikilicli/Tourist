//
//  PlaceDetail.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 18.06.2023.
//

import Foundation

// MARK: - PlaceDetail
struct PlaceDetail: Codable {
    let type: String?
    let features: [DetailFeature]?
}

// MARK: - Feature
struct DetailFeature: Codable {
    let type: String?
    let properties: DetailProperties?
    let geometry: DetailGeometry?
}

// MARK: - Geometry
struct DetailGeometry: Codable {
    let type: String?
    let coordinates: [Double]?
}

// MARK: - Properties
struct DetailProperties: Codable {
    let feature_type, name: String?
    let contact: Contact?
    let datasource: Datasource?
    let street, city, county, state: String?
    let address_line1, address_line2: String?
    let lat, lon: Double?
    let place_id: String?

}

// MARK: - Contact
struct Contact: Codable {
    let phone: String?
}

// MARK: - Datasource
struct Datasource: Codable {
    let sourcename, attribution, license: String?
    let url: String?
    let raw: Raw?
}

// MARK: - Raw
struct Raw: Codable {
    let name, phone: String?
    let oss_id: Int?
    let amenity, osm_type, addr_city, healthcare: String?
    let addr_street, addr_district: String?
}

