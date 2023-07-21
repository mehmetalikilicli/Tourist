//
//  PlaceCategoryCollectionViewCell.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.07.2023.
//

import UIKit

class PlaceCategoryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var placeCategoryName: UILabel!
    @IBOutlet weak var placeCategoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(placeCategory: PlaceCategory) {
           placeCategoryName.text = placeCategory.name ?? "Unknown"
           placeCategoryImage.image = UIImage(named: placeCategory.image ?? "tourist")
       }
}
