//
//  PlaceCategoryService.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 14.06.2023.
//

import Foundation

class PlaceCategoryService{
    
    static let shared = PlaceCategoryService()
    
    private var placeCategoriesList : [PlaceCategory] = [
    PlaceCategory(name: "Flo", image: "flo"),
    //PlaceCategory(name: "Sport IN Street", image: "sportinstreet"),
    PlaceCategory(name: "Restaurant", image: "restaurant1"),
    PlaceCategory(name: "Hotel", image: "hotel1"),
    PlaceCategory(name: "Museum", image: "museum1"),
    PlaceCategory(name: "Bus Station", image: "busStation1"),
    PlaceCategory(name: "Hospital", image: "hospital1"),
    PlaceCategory(name: "Pharmacy", image: "pharmacy1"),
    PlaceCategory(name: "Bank - ATM", image: "atm1"),
    PlaceCategory(name: "Cafe", image: "cafe1"),
    PlaceCategory(name: "Airport", image: "airport1"),
    PlaceCategory(name: "Train Station", image: "trainStation1"),
    //PlaceCategory(name: "Rent A Car", image: "rentACar"),
    PlaceCategory(name: "Outdoor And Sport", image: "outdoorandsport1"),
    PlaceCategory(name: "Camping Site", image: "campingsite1"),
    PlaceCategory(name: "Cinema", image: "cinema1"),
    PlaceCategory(name: "Theatre", image: "theatre1"),
    PlaceCategory(name: "Zoo", image: "zoo1"),
    PlaceCategory(name: "Shopping Mall", image: "shoppingmall1"),
    PlaceCategory(name: "Supermarket", image: "supermarket1"),
    ]
    
    func getPlaceCategories() -> [PlaceCategory]{
        return placeCategoriesList
    }
}
