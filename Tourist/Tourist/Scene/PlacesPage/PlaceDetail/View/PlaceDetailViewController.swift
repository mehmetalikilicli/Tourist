//
//  PlaceDetailViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 28.06.2023.
//

import UIKit
import MapKit
import CoreData

class PlaceDetailViewController: UIViewController {
        
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLine1Label: UILabel!
    @IBOutlet weak var addressLine2Label: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var viewModel: PlaceDetailViewModel!
    var placeDetail : DetailFeature?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setUpUI()
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        viewModel.addFavorite()
    }
    
    @IBAction func share(_ sender: Any) {
        viewModel.shareFavorite()
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
        let placeShowOnMapVC = ShowPlaceOnMapViewController()
        placeShowOnMapVC.place = viewModel.placeDetail
        
        self.navigationController?.pushViewController(placeShowOnMapVC, animated: true)
    }
}

extension PlaceDetailViewController: PlaceDetailViewModelDelegate {
    func placeDetailFetched(placeDetail: DetailFeature) {
        self.placeDetail = placeDetail
    }
    
    
    func showError(message: String) {
        Alert.makeAlert(viewController: self, title: "Bilgi", message: message)
    }
}
