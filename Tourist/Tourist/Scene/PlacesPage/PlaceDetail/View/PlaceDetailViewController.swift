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
        makeAlert(title: "Favoriye Eklendi", message: "\(viewModel.placeDetail?.properties?.name ?? "Bu yer") başarılı bir şekilde favorilere eklendi.")
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        viewModel.addFavorite()
    }
    
    @IBAction func share(_ sender: Any) {
        viewModel.share()
    }
    
    func setUpUI() {
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
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        
        // Assuming this view controller is presented
        present(alert, animated: true, completion: nil)
    }
}
