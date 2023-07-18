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
            return UIImage(named: "restaurant")
        } else if categories.contains("commercial.clothing.shoes"){
            return UIImage(named: "flo")
        } else if categories.contains("catering.restaurant"){
            return UIImage(named: "restaurant")
        } else if categories.contains("accommodation.hotel"){
            return UIImage(named: "hotel")
        } else if categories.contains("entertainment.museum"){
            return UIImage(named: "museum")
        } else if categories.contains("public_transport.bus"){
            return UIImage(named: "busStation")
        } else if categories.contains("healthcare.hospital"){
            return UIImage(named: "hospital")
        } else if categories.contains("healthcare.pharmacy"){
            return UIImage(named: "pharmacy")
        } else if categories.contains("service.financial.atm"){
            return UIImage(named: "atm")
        } else if categories.contains("catering.cafe"){
            return UIImage(named: "cafe")
        } else if categories.contains("airport.international"){
            return UIImage(named: "airport")
        } else if categories.contains("public_transport.train"){
            return UIImage(named: "trainStation")
        } else if categories.contains("commercial.outdoor_and_sport"){
            return UIImage(named: "outdoorandsport")
        } else if categories.contains("camping.camp_site"){
            return UIImage(named: "campingsite")
        } else if categories.contains("entertainment.cinema"){
            return UIImage(named: "cinema")
        } else if categories.contains("entertainment.zoo"){
            return UIImage(named: "zoo")
        } else if categories.contains("entertainment.culture.theatre"){
            return UIImage(named: "theatre")
        } else if categories.contains("commercial.shopping_mall"){
            return UIImage(named: "shoppingmall")
        } else if categories.contains("commercial.supermarket"){
            return UIImage(named: "supermarket")
        } else {
            return UIImage(named: "tourist")
        }
    }
}
