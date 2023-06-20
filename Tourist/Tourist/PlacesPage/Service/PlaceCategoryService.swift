//
//  PlaceCategoryService.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 14.06.2023.
//

import Foundation

class PlaceCategoryService{
    
    static let shared = PlaceCategoryService()
    
    var placeCategoriesList : [PlaceCategory] = [
    PlaceCategory(name: "Restaurant", image: "restaurant"),
    PlaceCategory(name: "Hotel", image: "hotel"),
    PlaceCategory(name: "Museum", image: "museum"),
    PlaceCategory(name: "Bus Station", image: "busStation"),
    PlaceCategory(name: "Hospital", image: "hospital"),
    PlaceCategory(name: "Pharmacy", image: "pharmacy"),
    PlaceCategory(name: "Bank - ATM", image: "atm"),
    PlaceCategory(name: "Cafe", image: "cafe"),
    PlaceCategory(name: "Airport", image: "airport"),
    PlaceCategory(name: "Train Station", image: "trainStation"),
    //PlaceCategory(name: "Rent A Car", image: "rentACar"),
    ]
    
    func getPlaceCategories() -> [PlaceCategory]{
        return placeCategoriesList
    }
}
