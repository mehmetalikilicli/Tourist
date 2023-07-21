//
//  ShowPlaceOnMapViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.07.2023.
//

import UIKit
import MapKit
import CoreLocation

class ShowPlaceOnMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var place : DetailFeature?
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        showPlaceOnMap()
    }
    
    func showPlaceOnMap(){
        
            let annotation = MKPointAnnotation()
            annotation.title = place?.properties?.name
            let coordinate = CLLocationCoordinate2D(latitude: (place?.properties?.lat)!, longitude: (place?.properties?.lon)!)
            annotation.coordinate = coordinate
            
            mapView.addAnnotation(annotation)
            
            locationManager.stopUpdatingLocation()
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        
    }
    
    func configuration(){

        //MapView
        mapView.delegate = self
        mapView.showsUserLocation = true

        //Location Manager
        locationManager.delegate = self
        //For Best Location Accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Persmission for use location when use app
        locationManager.requestWhenInUseAuthorization()
        //Start Location
        locationManager.startUpdatingLocation()
    }
    
}

extension ShowPlaceOnMapViewController: MKMapViewDelegate,  CLLocationManagerDelegate{
    
    //Custom Pin
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "placesAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.tintColor = UIColor.blue
            
            let button = UIButton(type: UIButton.ButtonType.infoDark)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    //Show Map Route
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let selectedAnnotation = view.annotation as? MKPointAnnotation {
            let latitude = selectedAnnotation.coordinate.latitude
            let longitude = selectedAnnotation.coordinate.longitude
            
            // Selected location latitude and longitude values
            //print("Latitude: \(latitude), Longitude: \(longitude)")
            
            let requestLocation = CLLocation(latitude: latitude, longitude: longitude)
            
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placemarks, error in
                
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        
                        let newPlacemark = MKPlacemark(placemark: placemark[0])
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = selectedAnnotation.title
                        let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
                        item.openInMaps(launchOptions: launchOption)
                        
                    }
                }
            }
        }
    }
}
