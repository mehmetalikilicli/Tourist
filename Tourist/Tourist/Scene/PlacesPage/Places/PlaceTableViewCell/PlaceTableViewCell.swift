//
//  PlacesTableViewCell.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 15.06.2023.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placeDistance: UILabel!
    
    var placeCateory: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpCell(place: Feature){
        placeImage.image = UIImage.imageForCategory(categories: (place.properties?.categories)!)
            placeName.text = place.properties?.name ?? "Place Name"
            placeAddress.text = place.properties?.suburb ?? "Place Address"
            placeDistance.text = place.properties?.distance != nil ? "\(String((place.properties?.distance)!))m" : nil
    }
}
