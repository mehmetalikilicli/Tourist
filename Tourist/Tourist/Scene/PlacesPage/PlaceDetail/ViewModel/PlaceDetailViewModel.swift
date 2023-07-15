//
//  PlaceDetailViewModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 14.07.2023.
//

import UIKit

protocol PlaceDetailViewModelDelegate: AnyObject {
    func favoriteAdded()
}

class PlaceDetailViewModel {
    
    weak var delegate: PlaceDetailViewModelDelegate?
    
    var placeDetail: DetailFeature?
    
    init(placeDetail: DetailFeature){
        self.placeDetail = placeDetail
    }
    
    func getPlaceDetail(placeId: String) {
        PlaceDetailService.shared.getPlaceDetail(placeId: placeId) { [weak self] placeDetail in
            self?.placeDetail = placeDetail
        }
    }
    
    func addFavorite() {
        
        var place_id = String()
        
        if let placeDetail = placeDetail {
            place_id = (placeDetail.properties?.place_id)!
        }
        
        
        FavoriteService.shared.addFavoritePlace(placeId: place_id) { [weak self] success in
            guard let self = self else { return }
            
            if success {
                print("Eklendi.")
            } else {
                print("Eklenemedi.")
            }
        }
        
        delegate?.favoriteAdded()
    }
    
    func share() {
        let message = "\(placeDetail?.properties?.name ?? "Bu Yer") paylaşıldı."
        showAlert(title: "Paylaşıldı", message: message)
    }
    
    func showOnMapButton(navigationController: UINavigationController?) {
        guard let placeDetail = placeDetail else {
            showAlert(title: "Hata", message: "Bu yerin konumuna ulaşılamıyor!")
            return
        }
        
        let placeShowOnMapVC = ShowPlaceOnMapViewController()
        placeShowOnMapVC.place = placeDetail
        
        if let navigationController = navigationController {
            navigationController.pushViewController(placeShowOnMapVC, animated: true)
        } else {
            // Present the view controller modally if there is no navigation controller
            //present(placeShowOnMapVC, animated: true, completion: nil)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        
        // Assuming this view controller is presented
        //present(alert, animated: true, completion: nil)
    }
}
