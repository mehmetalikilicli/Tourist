//
//  FavoriteTableViewCell.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 18.07.2023.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setUpCell(place: DetailFeature){
        self.favoriteImageView.image = UIImage.imageForCategory(categories: (place.properties?.categories)!)
        self.nameLabel.text = place.properties?.name ?? "Place Name"
        self.addressLabel.text = place.properties?.address_line2 ?? "Address"
        
    }
    
}
