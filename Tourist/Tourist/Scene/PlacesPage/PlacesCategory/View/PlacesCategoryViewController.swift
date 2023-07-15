//
//  PlacesCategoryViewConroller.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 8.07.2023.
//

import UIKit
import CoreLocation


class PlacesCategoryViewController: UIViewController {
    
    @IBOutlet weak var placeCollectionView: UICollectionView!
    var viewModel: PlaceCategoryViewModel!
    
    //For user current location. This send to viewModel and then service for get user location.
    let locationManager = CLLocationManager()
    var currentLatitude = CLLocationDegrees()
    var currentLongitude = CLLocationDegrees()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        congigureLocationManager()
        setupViewModel()
        viewModel.fetchPlaceCategories()
    }
    
    private func configureCollectionView() {
        placeCollectionView.dataSource = self
        placeCollectionView.delegate = self
        placeCollectionView.register(UINib(nibName: "PlaceCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "placeCategoryCell")
    }
    
    private func setupViewModel() {
        viewModel = PlaceCategoryViewModel()
        viewModel.delegate = self
    }
    
    private func congigureLocationManager(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
}

extension PlacesCategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.placeCategoriesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "placeCategoryCell", for: indexPath) as! PlaceCategoryCollectionViewCell
        let placeCategory = viewModel.placeCategory(at: indexPath.row)
        cell.placeCategoryName.text = placeCategory.name
        cell.placeCategoryImage.image = UIImage(named: placeCategory.image ?? "")
        return cell
    }
    
    
}

extension PlacesCategoryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 144, height: 180)
        }
}

extension PlacesCategoryViewController: PlaceCategoryViewModelDelegate {
    func placeCategoriesFetched() {
        DispatchQueue.main.async {
            self.placeCollectionView.reloadData()
        }
    }
    
    func didSelectPlaceCategory(_ places: [Feature]) {
        DispatchQueue.main.async {
            let placesViewModel = PlacesViewModel(places: places)
            let placesVC = PlacesViewController()
            placesVC.viewModel = placesViewModel
            self.navigationController?.pushViewController(placesVC, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectPlaceCategory(at: indexPath.row,latitude: currentLatitude, longitude: currentLongitude)
    }
}

extension PlacesCategoryViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            self.currentLatitude = location.coordinate.latitude
            self.currentLongitude = location.coordinate.longitude
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
