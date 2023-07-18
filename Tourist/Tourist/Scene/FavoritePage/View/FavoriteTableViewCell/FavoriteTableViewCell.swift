//
//  FavoriteTableViewCell.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 3.07.2023.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var suburbLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(place: DetailFeature){
        self.favoriteImageView.image = UIImage.imageForCategory(categories: (place.properties?.categories)!)
        self.nameLabel.text = place.properties?.name ?? "Place Name"
        self.suburbLabel.text = place.properties?.address_line2 ?? "Address"
        
    }
    
}
