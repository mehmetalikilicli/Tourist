//
//  PlacesViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.06.2023.
//

import UIKit

class PlacesCategoryViewController: UIViewController {
    
    var placeCategoriesList = [PlaceCategory]()
    var placesList : [Feature]?
    
    
    @IBOutlet weak var placeCategoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCategoriesList()
        
        placeCategoryTableView.delegate = self
        placeCategoryTableView.dataSource = self

        placeCategoryTableView.register(UINib(nibName: "PlaceCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "placeCategoryCell")
        
    }
    
    private func fetchCategoriesList(){
        placeCategoriesList =  PlaceCategoryService.shared.getPlaceCategories()
    }
}

extension PlacesCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeCategoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCategoryCell",for: indexPath) as! PlaceCategoryTableViewCell
        cell.placeCategoryName.text = placeCategoriesList[indexPath.row].name
        cell.placeCategoryImage.image = UIImage(named: "\(placeCategoriesList[indexPath.row].image!)")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PlaceService.shared.getPlaces(placeName: placeCategoriesList[indexPath.row].name!, completion: { placeList in
            DispatchQueue.main.async {
                let placesVC = PlacesViewController()
                placesVC.places = placeList!
                self.navigationController?.pushViewController(placesVC, animated: true)
            }
        })
    }
}
