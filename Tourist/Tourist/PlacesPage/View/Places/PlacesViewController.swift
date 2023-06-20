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
    
    var places = [Feature]()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        configuration()
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
    }
}

extension PlacesViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell",for: indexPath) as! PlaceTableViewCell
        cell.setUpCell(place: places[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        PlaceDetailService.shared.getPlaceDetail(placeId: (places[indexPath.row].properties?.place_id)!) { detailFeature in
            DispatchQueue.main.async {
                let placeDetailVC = PlaceDetailViewController()
                placeDetailVC.placeDetail = detailFeature!
                self.navigationController?.pushViewController(placeDetailVC, animated: true)
            }
        }
    }
}
