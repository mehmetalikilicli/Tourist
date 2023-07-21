//
//  FavoriteViewModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 4.07.2023.
//

import UIKit
import CoreData

protocol FavoriteViewModelDelegate: AnyObject {
    func favoritePlacesUpdated()
    func showError(title: String, message: String)
}

class FavoriteViewModel {
    weak var delegate: FavoriteViewModelDelegate?
    var favoritePlacesIdList = [String]()
    var favoritePlacesList = [DetailFeature]()
    
    func getFavoritePlaces() {
        FavoriteService.shared.getFavoritePlaces { [weak self] places in
            guard let self = self else { return }
            self.favoritePlacesIdList = places
            self.getFavoritePlacesDetails()
        }
    }
    
    private func getFavoritePlacesDetails() {
        favoritePlacesList.removeAll()
        
        //For async get placeDetails from service
        let dispatchGroup = DispatchGroup()
        
        for placeId in favoritePlacesIdList {
            dispatchGroup.enter()
            
            PlaceDetailService.shared.getPlaceDetail(placeId: placeId) { [weak self] detailFeature in
                guard let self = self else { return }
                
                if let detailFeature = detailFeature {
                    self.favoritePlacesList.append(detailFeature)
                } else {
                    self.delegate?.showError(title: "Hata", message: "Favori Yerleriniz Getirilemedi!")
                }
                
                dispatchGroup.leave()
            }
            //dispatchGroup.wait()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.delegate?.favoritePlacesUpdated()
        }
    }
    
    func addFavoritePlace(placeId: String) {
        FavoriteService.shared.addFavoritePlace(placeId: placeId) { [weak self] success in
            guard let self = self else { return }
            
            if success {
                self.getFavoritePlaces()
            } else {
                self.delegate?.showError(title: "Hata", message: "Favori Yer Eklenirken Bir Hata Oluştu!")
            }
        }
    }
    
    func deleteFavoritePlace(at indexPath: IndexPath) {
        let placeId = favoritePlacesIdList[indexPath.row]
        
        FavoriteService.shared.deleteFavoritePlace(placeId: placeId) { [weak self] success in
            guard let self = self else { return }
            
            if success {
                self.favoritePlacesIdList.remove(at: indexPath.row)
                self.favoritePlacesList.remove(at: indexPath.row)
                self.delegate?.favoritePlacesUpdated()
            } else {
                self.delegate?.showError(title: "Hata", message: "Favori Yer Silinirken Bir Hata Oluştu!")
            }
        }
    }
}
