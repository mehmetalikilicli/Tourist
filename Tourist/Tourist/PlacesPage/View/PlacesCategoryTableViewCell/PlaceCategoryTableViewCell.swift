//
//  PlaceCategoryTableViewCell.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 14.06.2023.
//

import UIKit

class PlaceCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var placeCategoryName: UILabel!
    
    @IBOutlet weak var placeCategoryImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
