//
//  PlacesViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 15.06.2023.
//

import UIKit
import MapKit

class PlacesViewController: UIViewController {

    @IBOutlet weak var placeTableView: UITableView!
    
    @IBOutlet weak var showOnMap: UIButton!
    var places = [Feature]()
    var checkedPlaces = [Feature]()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        configuration()
        checkPlaces()
    }
    
    //Some places' name come nil from api.
    func checkPlaces(){
        for place in places {
            if place.properties?.name != nil {
                checkedPlaces.append(place)
            }
        }
    }
    
    @IBAction func showOnMap(_ sender: Any) {
        
        let showOnMapVC = ShowOnMapViewController()
        showOnMapVC.places = self.places
        self.navigationController?.pushViewController(showOnMapVC, animated: true)
        
    }

    func configuration(){
        placeTableView.delegate = self
        placeTableView.dataSource = self
        placeTableView.register(UINib(nibName: "PlacesTableViewCell", bundle: nil), forCellReuseIdentifier: "placeCell")
        
        navigationController?.navigationBar.tintColor = .black
        showOnMap.layer.cornerRadius = 12
        showOnMap.layer.masksToBounds = true
        title = "Places"
    }
}

extension PlacesViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkedPlaces.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell",for: indexPath) as! PlaceTableViewCell
        cell.setUpCell(place: checkedPlaces[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PlaceDetailService.shared.getPlaceDetail(placeId: (places[indexPath.row].properties?.place_id)!) { detailFeature in
            DispatchQueue.main.async {
                let placeDetailVC = PlaceDetailViewController()
                placeDetailVC.placeDetail = detailFeature
                self.navigationController?.pushViewController(placeDetailVC, animated: true)
            }
        }
    }
}
