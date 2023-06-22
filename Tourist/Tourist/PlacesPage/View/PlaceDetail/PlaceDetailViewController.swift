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
    
    
    @IBAction func addFavorite(_ sender: Any) {
        makeAlert(title: "Favoriye Eklendi", message: "\(placeDetail?.properties?.name! ?? "Bu yer") başarılı bir şekilde favorilere eklendi.")
    }
    
    @IBAction func share(_ sender: Any) {
        makeAlert(title: "Paylaşıldı", message: "\(placeDetail?.properties?.name! ?? "Bu Yer") paylaşıldı.")
    }
    func setUpUI(){
        
        if let placeDetail = placeDetail {
            nameLabel.text = placeDetail.properties?.name ?? "Unknown Name"
            adressLine1Label.text = placeDetail.properties?.address_line1 ?? "Adress Line 1"
            adressLine2Label.text = placeDetail.properties?.address_line2 ?? "Adress Line 2"
            phoneNumberLabel.text = placeDetail.properties?.contact?.phone ?? "Unknown Phone Number"
            stateLabel.text = placeDetail.properties?.state ?? "Unknown State"
            cityLabel.text = placeDetail.properties?.city ?? "Unknown City"
            //descriptionLabel.text = placeDetail.type?.description 
        }
    }
    
    
    @IBAction func showOnMapButton(_ sender: Any) {
        
        if placeDetail != nil{
            let placeShowOnMapVC = ShowPlaceOnMapViewController()
            placeShowOnMapVC.place = placeDetail
            self.navigationController?.pushViewController(placeShowOnMapVC, animated: true)
        } else {
            makeAlert(title: "Hata", message: "Bu yerin konumuna ulaşılamıyor!")
        }
    }
    
    func makeAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
}
