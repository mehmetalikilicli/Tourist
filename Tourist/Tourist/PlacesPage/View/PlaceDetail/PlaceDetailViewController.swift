//
//  PlaceDetailViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 18.06.2023.
//

import UIKit
import MapKit

class PlaceDetailViewController: UIViewController {
    
    var placeDetail: DetailFeature?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLine1Label: UILabel!
    @IBOutlet weak var adressLine2Label: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        
    }
    
    func setUpUI(){
        
        if let placeDetail = placeDetail {
            nameLabel.text = placeDetail.properties?.name ?? "Unknown Name"
            adressLine1Label.text = placeDetail.properties?.address_line1 ?? "Adress Line 1"
            adressLine2Label.text = placeDetail.properties?.address_line2 ?? "Adress Line 2"
            phoneNumberLabel.text = placeDetail.properties?.contact?.phone ?? "Unknown Phone Number"
            stateLabel.text = placeDetail.properties?.state ?? "Unknown State"
            cityLabel.text = placeDetail.properties?.city ?? "Unknown City"
            descriptionLabel.text = placeDetail.type?.description 
        }

        
        
        

        
    }
    
    
    @IBAction func showOnMapButton(_ sender: Any) {
        
        let placeShowOnMapVC = ShowPlaceOnMapViewController()
        placeShowOnMapVC.place = placeDetail
        self.navigationController?.pushViewController(placeShowOnMapVC, animated: true)
    }
}
