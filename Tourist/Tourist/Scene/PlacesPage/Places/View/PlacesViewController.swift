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
    
    var viewModel: PlacesViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //viewModel = PlacesViewModel()
        viewModel.delegate = self
        viewModel.checkPlaces()
        configureUI()
    }
    
    @IBAction func showOnMap(_ sender: Any) {
        let checkedPlaces = viewModel.showOnMap()
        let showOnMapVC = ShowOnMapViewController()
        showOnMapVC.places = checkedPlaces
        self.navigationController?.pushViewController(showOnMapVC, animated: true)
    }
    
    private func configureUI() {
        placeTableView.dataSource = self
        placeTableView.delegate = self
        placeTableView.register(UINib(nibName: "PlacesTableViewCell", bundle: nil), forCellReuseIdentifier: "placeCell")
        showOnMap.layer.cornerRadius = 12
        title = String.labeForCategory(categories: (viewModel.checkedPlace(at: 0).properties?.categories)!)
        navigationController?.navigationBar.tintColor = .black

    }
    
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.checkedPlacesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceTableViewCell
        let place = viewModel.checkedPlace(at: indexPath.row)
        cell.setUpCell(place: place)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.getPlaceDetail(at: indexPath.row)
    }
}

extension PlacesViewController: PlacesViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.placeTableView.reloadData()
        }
    }
    
    func showPlaceDetail(_ detailFeature: DetailFeature) {
        DispatchQueue.main.async { [weak self] in
            let viewModel = PlaceDetailViewModel(placeDetail: detailFeature)
            let placeDetailVC = PlaceDetailViewController()
            placeDetailVC.viewModel = viewModel
            self?.navigationController?.pushViewController(placeDetailVC, animated: true)
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async { [weak self] in
            // Handle error display, e.g., show an alert
            //self?.showAlert(message: message)
        }
    }
}
