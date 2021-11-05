//
//  ChefPortraitCell.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import UIKit
import Kingfisher

class ChefPortraitCell: UICollectionViewCell, ChefDishProtocol {
    
    static let id = "ChefPortraitCell"
    
    @IBOutlet weak var backView: UIView!{didSet{backView.layer.cornerRadius = 15}}
    @IBOutlet weak var chefImageView: UIImageView!{didSet{chefImageView.layer.cornerRadius = 10}}
    @IBOutlet weak var chefTitleLbl: UILabel!
    @IBOutlet weak var chefDescriptionLbl: UILabel!
    @IBOutlet weak var chefCaloriesLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUpCell(chefDish: Dish) {
        self.chefTitleLbl.text = chefDish.name
        self.chefImageView.kf.setImage(with: chefDish.image?.asURL)
        self.chefCaloriesLbl.text = "\(chefDish.calories ?? 0)"
        self.chefDescriptionLbl.text = chefDish.description
    }
    
}
