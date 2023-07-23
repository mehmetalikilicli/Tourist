//
//  PlaceUImage+Ext.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 17.07.2023.
//

import Foundation
import UIKit

extension UIImage {
    static func imageForCategory(categories: [String]) -> UIImage? {
        
        if categories.contains("catering.restaurant") {
            return UIImage(named: "restaurant1")
        } else if categories.contains("commercial.clothing.shoes"){
            return UIImage(named: "flo")
        } else if categories.contains("catering.restaurant"){
            return UIImage(named: "restaurant1")
        } else if categories.contains("accommodation.hotel"){
            return UIImage(named: "hotel1")
        } else if categories.contains("entertainment.museum"){
            return UIImage(named: "museum1")
        } else if categories.contains("public_transport.bus"){
            return UIImage(named: "busStation1")
        } else if categories.contains("healthcare.hospital"){
            return UIImage(named: "hospital1")
        } else if categories.contains("healthcare.pharmacy"){
            return UIImage(named: "pharmacy1")
        } else if categories.contains("service.financial.atm"){
            return UIImage(named: "atm1")
        } else if categories.contains("catering.cafe"){
            return UIImage(named: "cafe1")
        } else if categories.contains("airport.international"){
            return UIImage(named: "airport1")
        } else if categories.contains("public_transport.train"){
            return UIImage(named: "trainStation1")
        } else if categories.contains("commercial.outdoor_and_sport"){
            return UIImage(named: "outdoorandsport1")
        } else if categories.contains("camping.camp_site"){
            return UIImage(named: "campingsite1")
        } else if categories.contains("entertainment.cinema"){
            return UIImage(named: "cinema1")
        } else if categories.contains("entertainment.zoo"){
            return UIImage(named: "zoo1")
        } else if categories.contains("entertainment.culture.theatre"){
            return UIImage(named: "theatre1")
        } else if categories.contains("commercial.shopping_mall"){
            return UIImage(named: "shoppingmall1")
        } else if categories.contains("commercial.supermarket"){
            return UIImage(named: "supermarket1")
        } else {
            return UIImage(named: "tourist")
        }
    }
}
