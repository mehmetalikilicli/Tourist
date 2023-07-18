//
//  PlaceDetailViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 18.06.2023.
//

import UIKit
import MapKit
import CoreData

class PlaceDetailViewController: UIViewController, PlaceDetailViewModelDelegate {
    
    var viewModel: PlaceDetailViewModel!
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLine1Label: UILabel!
    @IBOutlet weak var addressLine2Label: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewModel = PlaceDetailViewModel()
        viewModel.delegate = self
        setUpUI()
    }
    
    func favoriteAdded() {
        Alert.makeAlert(viewController: self, title: "Favoriye Eklendi", message: "\(viewModel.placeDetail?.properties?.name ?? "Bu yer") başarılı bir şekilde favorilere eklendi.")
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        viewModel.addFavorite()
    }
    
    @IBAction func share(_ sender: Any) {
        Alert.makeAlert(viewController: self, title: "Paylaşıldı", message: "\(viewModel.placeDetail?.properties?.name ?? "Bu yer") başarılı bir şekilde paylaşıldı.")
        viewModel.share()
    }
    
    func setUpUI() {
        detailImageView.image = UIImage.imageForCategory(categories: (viewModel.placeDetail?.properties?.categories)!)
        nameLabel.text = viewModel.placeDetail?.properties?.name ?? "Unknown Name"
        addressLine1Label.text = viewModel.placeDetail?.properties?.address_line1 ?? "Address Line 1"
        addressLine2Label.text = viewModel.placeDetail?.properties?.address_line2 ?? "Address Line 2"
        phoneNumberLabel.text = viewModel.placeDetail?.properties?.contact?.phone ?? "Unknown Phone Number"
        stateLabel.text = viewModel.placeDetail?.properties?.state ?? "Unknown State"
        cityLabel.text = viewModel.placeDetail?.properties?.city ?? "Unknown City"
    }
    
    @IBAction func showOnMapButton(_ sender: Any) {
        viewModel.showOnMapButton(navigationController: navigationController)
    }
}
