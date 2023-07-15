//
//  PlacesCategoryViewModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 8.07.2023.
//

import Foundation
import CoreLocation

protocol PlaceCategoryViewModelDelegate: AnyObject {
    func placeCategoriesFetched()
    func didSelectPlaceCategory(_ places: [Feature])
}


class PlaceCategoryViewModel {
    var placeCategoriesList = [PlaceCategory]()
    weak var delegate: PlaceCategoryViewModelDelegate?
    
    func fetchPlaceCategories() {
        placeCategoriesList = PlaceCategoryService.shared.getPlaceCategories()
        delegate?.placeCategoriesFetched()
    }
    
    func placeCategoriesCount() -> Int {
        return placeCategoriesList.count
    }
    
    func placeCategory(at index: Int) -> PlaceCategory {
        return placeCategoriesList[index]
    }
    
    func selectPlaceCategory(at index: Int, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let placeCategory = placeCategoriesList[index]
        PlaceService.shared.getPlaces(placeName: placeCategory.name ?? "museum",latitude: latitude, longitude: longitude) { [weak self] placeList in
            DispatchQueue.main.async {
                guard let placesList = placeList else {
                    // Yerler çekilemedi, hata durumuyla başa çıkılabilir
                    return
                }
                
                self?.delegate?.didSelectPlaceCategory(placesList)
            }
        }
    }
}
