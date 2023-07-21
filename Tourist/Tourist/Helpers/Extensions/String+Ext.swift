//
//  String+Ext.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 18.07.2023.
//

import Foundation


extension String {
    static func categoryText(categories: [String]) -> String? {
        
        if categories.contains("catering.restaurant") {
            return "Restaurant"
        } else if categories.contains("commercial.clothing.shoes"){
            return "FLO"
        } else if categories.contains("catering.restaurant"){
            return "Restaurant"
        } else if categories.contains("accommodation.hotel"){
            return "Hotel"
        } else if categories.contains("entertainment.museum"){
            return "Museum"
        } else if categories.contains("public_transport.bus"){
            return "Bus Station"
        } else if categories.contains("healthcare.hospital"){
            return "Hospital"
        } else if categories.contains("healthcare.pharmacy"){
            return "Pharmacy"
        } else if categories.contains("service.financial.atm"){
            return "Bank & ATM"
        } else if categories.contains("catering.cafe"){
            return "Cafe"
        } else if categories.contains("airport.international"){
            return "Airport"
        } else if categories.contains("public_transport.train"){
            return "Train Station"
        } else if categories.contains("commercial.outdoor_and_sport"){
            return "Outdoor & Sport"
        } else if categories.contains("camping.camp_site"){
            return "Camping Site"
        } else if categories.contains("entertainment.cinema"){
            return "Cinema"
        } else if categories.contains("entertainment.zoo"){
            return "Zoo"
        } else if categories.contains("entertainment.culture.theatre"){
            return "Theatre"
        } else if categories.contains("commercial.shopping_mall"){
            return "Shopping Mall"
        } else if categories.contains("commercial.supermarket"){
            return "Supermarket"
        } else {
            return "Tourist"
        }
    }
}
