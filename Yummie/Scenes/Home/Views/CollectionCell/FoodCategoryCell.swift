//
//  FoodCategoryCell.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import UIKit
import Kingfisher

class FoodCategoryCell: UICollectionViewCell ,FoodDishCategoryProtocol{
    
    
    
    static let id = "FoodCategoryCell"
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.clipsToBounds = false
        backView.layer.cornerRadius = 10
        backView.layer.shadowRadius = 1.2
        backView.layer.shadowOpacity = 0.85
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backView.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    func setUpCell(category: FoodDishCategory) {
        self.categoryTitleLabel.text = category.name
        self.categoryImageView.kf.setImage(with: category.image.asURL)
    }
    
    
}
