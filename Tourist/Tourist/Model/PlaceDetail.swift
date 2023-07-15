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
}

// MARK: - Properties
struct DetailProperties: Codable {
    let name: String?
    let contact: Contact?
    let city, state: String?
    let address_line1, address_line2: String?
    let lat, lon: Double?
    let place_id: String?
}

// MARK: - Contact
struct Contact: Codable {
    let phone: String?
}


