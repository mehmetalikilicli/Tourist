//
//  ShowOnMapViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 18.06.2023.
//

import UIKit
import MapKit

class ShowOnMapViewController: UIViewController {
    
    var places = [Feature]()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPlacesOnMap()
        
    }
    
    func showPlacesOnMap(){
        for place in places {
            
            let annotation = MKPointAnnotation()
            annotation.title = place.properties?.name
            //annotation.subtitle = place.properties?.distance
            let coordinate = CLLocationCoordinate2D(latitude: (place.properties?.lat)!, longitude: (place.properties?.lon)!)
            annotation.coordinate = coordinate
            
            mapView.addAnnotation(annotation)
            
            //locationManager.stopUpdatingLocation()
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
}
