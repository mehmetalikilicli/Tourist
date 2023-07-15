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

protocol PlacesViewModelProtocol {
    var delegate: PlacesViewModelDelegate? { get set }
    
    func checkPlaces()
    func showOnMap() -> [Feature]
    func getPlaceDetail(at index: Int)
    func updateUserCurrentLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    
    var checkedPlacesCount: Int { get }
    func checkedPlace(at index: Int) -> Feature
}

class PlacesViewModel: PlacesViewModelProtocol {
    
    weak var delegate: PlacesViewModelDelegate?
    
    private var places = [Feature]()
    private var checkedPlaces = [Feature]()
    
    init() {
        checkPlaces()
    }
    
    init(places: [Feature]){
        self.places = places
    }
    
    func checkPlaces() {
        for place in places {
            if let name = place.properties?.name {
                checkedPlaces.append(place)
            }
        }
        delegate?.reloadTableView()
    }
    
    func showOnMap() -> [Feature]{
        return checkedPlaces
    }
    
    func getPlaceDetail(at index: Int) {
        guard let placeId = places[index].properties?.place_id else {
            delegate?.showError(message: "Place ID not found")
            return
        }
        
        PlaceDetailService.shared.getPlaceDetail(placeId: placeId) { [weak self] detailFeature in
            if let detailFeature = detailFeature {
                self?.delegate?.showPlaceDetail(detailFeature)
            } else {
                self?.delegate?.showError(message: "Failed to fetch place detail")
            }
        }
    }
    
    func updateUserCurrentLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
    }
    
    var checkedPlacesCount: Int {
        return checkedPlaces.count
    }
    
    func checkedPlace(at index: Int) -> Feature {
        return checkedPlaces[index]
    }
}
