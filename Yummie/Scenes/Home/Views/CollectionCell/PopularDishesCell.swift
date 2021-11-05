//
//  PopularDishesCell.swift
//  Yummie
//
//  Created by Ahmed Fathy on 11/10/2021.
//

import UIKit
import Kingfisher

class PopularDishesCell: UICollectionViewCell ,PopularDishProtocol{
    
    

    static let id = "PopularDishesCell"
    
    @IBOutlet weak var backView: UIView!{didSet{backView.layer.cornerRadius = 10}}
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var dishFoodImage: UIImageView!{didSet{dishFoodImage.layer.cornerRadius = 5}}
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(popularDish: Dish) {
        self.titleLabel.text = popularDish.name
        self.caloriesLbl.text = "\(popularDish.calories ?? 0) calories"
        self.dishFoodImage.kf.setImage(with: popularDish.image?.asURL)
        self.descriptionLbl.text = popularDish.description
    }
    
}
