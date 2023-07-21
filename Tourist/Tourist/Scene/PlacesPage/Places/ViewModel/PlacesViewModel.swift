//
//  PlacesViewModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 10.07.2023.
//

import CoreLocation

protocol PlacesViewModelDelegate: AnyObject {
    func reloadTableView()
    func showPlaceDetail(_ detailFeature: DetailFeature)
    func showError(message: String)
}

class PlacesViewModel {
    
    weak var delegate: PlacesViewModelDelegate?
    
    private var places = [Feature]()
    private var checkedPlaces = [Feature]()
    
    var checkedPlacesCount: Int {
        return checkedPlaces.count
    }
    
    init() {
        checkPlaces()
    }
    
    init(places: [Feature]){
        self.places = places
    }
    
    func checkPlaces() {
        //Some place has no name. Control place has name or not.
        //For just FLO and INSTREET shops
        
         for place in places {
             if let name = place.properties?.name, let categories = place.properties?.categories {
                 if categories.contains("commercial.clothing.shoes") && name == "FLO" || name == "Sport In Street"{
                     checkedPlaces.append(place)
                 } /*else if categories.contains("commercial.clothing.shoes") && name == "Sport In Street" {
                     checkedPlaces.append(place)
                 }*/  else if !categories.contains("commercial.clothing.shoes") {
                  checkedPlaces.append(place)
                 }
             }
         }
        
        delegate?.reloadTableView()
    }
    
    func getPlaceDetail(index : Int) {
        guard let placeId = checkedPlaces[index].properties?.place_id else {
            delegate?.showError(message: "Place ID bulunamadı!")
            return
        }
        
        PlaceDetailService.shared.getPlaceDetail(placeId: placeId) { [weak self] detailFeature in
            if let detailFeature = detailFeature {
                self?.delegate?.showPlaceDetail(detailFeature)
            } else {
                self?.delegate?.showError(message: "Yer Detayı Veritabanından Getirilemedi!")
            }
        }
    }
    
    func getPlaces() -> [Feature]{
        return checkedPlaces
    }
    
    func getPlace(index: Int) -> Feature {
        return checkedPlaces[index]
    }
    
}
