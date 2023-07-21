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
    
    var viewModel = PlacesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.checkPlaces()
        configureUI()
    }

    
    @IBAction func showOnMap(_ sender: Any) {
        let places = viewModel.getPlaces()
        let showOnMapVC = ShowOnMapViewController()
        showOnMapVC.places = places
        self.navigationController?.pushViewController(showOnMapVC, animated: true)
    }
    
    private func configureUI() {
        placeTableView.dataSource = self
        placeTableView.delegate = self
        placeTableView.register(UINib(nibName: "PlacesTableViewCell", bundle: nil), forCellReuseIdentifier: "placeCell")
        title = String.categoryText(categories: (viewModel.getPlace(index: 0).properties?.categories)!)
        navigationController?.navigationBar.tintColor = .black
    }
    
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.checkedPlacesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceTableViewCell
        let place = viewModel.getPlace(index: indexPath.row)
        cell.setUpCell(place: place)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getPlaceDetail(index: indexPath.row)
    }
}

extension PlacesViewController: PlacesViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.placeTableView.reloadData()
        }
    }
    
    func showPlaceDetail(_ detailFeature: DetailFeature) {
        DispatchQueue.main.async {
            let viewModel = PlaceDetailViewModel(placeDetail: detailFeature)
            let placeDetailVC = PlaceDetailViewController()
            placeDetailVC.viewModel = viewModel
            self.navigationController?.pushViewController(placeDetailVC, animated: true)
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async { [weak self] in
            Alert.makeAlert(viewController: self!, title: "Hata!", message: message)
        }
    }
}
