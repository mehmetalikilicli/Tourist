//
//  FavoritePlace.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 4.07.2023.
//

import Foundation

// MARK: - Feature
struct FavoriteFeature: Codable {
    var type: String?
    var properties: FavoriteProperties?
}

// MARK: - Properties
struct FavoriteProperties: Codable {
    var name: String?
    var contact: FavoriteContact?
    var city, state: String?
    var address_line1, address_line2: String?
    var lat, lon: Double?
    var place_id: String?
}

// MARK: - Contact
struct FavoriteContact: Codable {
    var phone: String?
}


