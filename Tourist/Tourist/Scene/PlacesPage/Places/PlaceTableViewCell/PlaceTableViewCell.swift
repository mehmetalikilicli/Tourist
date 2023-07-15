//
//  PlacesTableViewCell.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 15.06.2023.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var placeName: UILabel!
    
    @IBOutlet weak var placeDistance: UILabel!
    
    
    var place: Feature?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func getPlace(place: Feature){
        self.place = place
    }
    
    func setUpCell(place: Feature){
        placeName.text = place.properties?.name
        placeDistance.text = place.properties?.distance != nil ? "\(String((place.properties?.distance)!))m" : nil
    }
}
