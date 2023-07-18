//
//  FavoriteViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 3.07.2023.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController {
    @IBOutlet weak var favoriteTableView: UITableView!
    
    private var viewModel: FavoriteViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        viewModel = FavoriteViewModel()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getFavoritePlaces()
    }
    
    func configure() {
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
        
        favoriteTableView.register(UINib(nibName: "FavoriteTableViewCell", bundle: nil), forCellReuseIdentifier: "favoriteCell")
        navigationController?.navigationBar.tintColor = .black
        self.title = "Favorites"
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.favoritePlacesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell") as! FavoriteTableViewCell
        cell.setUpCell(place: viewModel.favoritePlacesList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteFavoritePlace(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let placeId = viewModel.favoritePlacesIdList[indexPath.row]
        PlaceDetailService.shared.getPlaceDetail(placeId: placeId) { [weak self] detailFeature in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let detailFeature = detailFeature {
                    let detailViewModel = PlaceDetailViewModel(placeDetail: detailFeature)
                    let placeDetailVC = PlaceDetailViewController()
                    placeDetailVC.viewModel = detailViewModel
                    self.navigationController?.pushViewController(placeDetailVC, animated: true)
                } else {
                    Alert.makeAlert(viewController: self, title: "Hata", message: "Yer Detayı Getirilemedi!")
                }
            }
        }
    }
}

extension FavoriteViewController: FavoriteViewModelDelegate {
    func favoritePlacesUpdated() {
        DispatchQueue.main.async {
            self.favoriteTableView.reloadData()
        }
    }
    
    func showError(title: String, message: String) {
        DispatchQueue.main.async {
            Alert.makeAlert(viewController: self, title: title, message: message)
        }
    }
}
