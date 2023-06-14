//
//  PlacesViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.06.2023.
//

import UIKit

class PlacesViewController: UIViewController {
    
    var placeCategoriesList = [PlaceCategory]()
    
    
    @IBOutlet weak var placesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCategoriesList()
        
        placesTableView.delegate = self
        placesTableView.dataSource = self
        

        placesTableView.register(UINib(nibName: "PlaceCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "placeCategoryCell")

        
        
    }
    
    private func fetchCategoriesList(){
        placeCategoriesList =  PlaceCategoryService.shared.getPlaceCategories()
    }
}

extension PlacesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeCategoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCategoryCell",for: indexPath) as! PlaceCategoryTableViewCell
        cell.placeCategoryName.text = placeCategoriesList[indexPath.row].name
        cell.placeCategoryImage.image = UIImage(named: "\(placeCategoriesList[indexPath.row].image!)")
        return cell
    }
}
