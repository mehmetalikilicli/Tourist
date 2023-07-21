//
//  PlaceDetailViewModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 14.07.2023.
//

import UIKit

protocol PlaceDetailViewModelDelegate: AnyObject {
    func placeDetailFetched(placeDetail: DetailFeature)
    func showError(message : String)
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
        delegate?.placeDetailFetched(placeDetail: placeDetail!)
    }
    
    func addFavorite() {
        var place_id = String()
        
        if let placeDetail = placeDetail {
            place_id = (placeDetail.properties?.place_id)!
        }
        
        FavoriteService.shared.addFavoritePlace(placeId: place_id) { [weak self] success in
            if success {
                self?.delegate?.showError(message: "\(self?.placeDetail?.properties?.name ?? "Bu yer") başarılı bir şekilde favorilere eklendi.")
            } else {
                self?.delegate?.showError(message: "Bu yer favorilere eklenemedi!")
            }
        }
    }
    
    func shareFavorite() {
        delegate?.showError(message: "\(placeDetail?.properties?.name ?? "Bu yer") başarılı bir şekilde paylaşıldı.")
    }
}
