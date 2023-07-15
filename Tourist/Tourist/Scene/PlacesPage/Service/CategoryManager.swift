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
    PlaceCategory(name: "Outdoor And Sport", image: "outdoorandsport"),
    PlaceCategory(name: "Camping Site", image: "campingsite"),
    PlaceCategory(name: "Cinema", image: "cinema"),
    PlaceCategory(name: "Theatre", image: "theatre"),
    PlaceCategory(name: "Zoo", image: "zoo"),
    PlaceCategory(name: "Shopping Mall", image: "shoppingmall"),
    PlaceCategory(name: "Supermarket", image: "supermarket"),
    ]
    
    func getPlaceCategories() -> [PlaceCategory]{
        return placeCategoriesList
    }
}
