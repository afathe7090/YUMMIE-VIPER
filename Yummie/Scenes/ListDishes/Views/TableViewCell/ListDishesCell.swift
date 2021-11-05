//
//  ListDishesCell.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import UIKit
import Kingfisher

class ListDishesCell: UITableViewCell, ListDishesCellProtocol ,ListOrdersTableViewCell{

    
    static let id = "ListDishesCell"
    
    
    @IBOutlet weak var backView: UIView!{didSet{backView.layer.cornerRadius = 15}}
    @IBOutlet weak var deshImageView: UIImageView!{didSet{deshImageView.layer.cornerRadius = 5}}
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
    func setUICell(viewModel: Dish){
        self.descriptionLBL.text = viewModel.description
        self.titleLBL.text = viewModel.name
        self.deshImageView.kf.setImage(with: viewModel.image?.asURL )
    }
    
    
    func setListOrderDishes(viewModel: Order) {
        self.deshImageView.kf.setImage(with: viewModel.dish?.image?.asURL)
        self.titleLBL.text = viewModel.dish?.name
        self.descriptionLBL.text = viewModel.dish?.description
    }
    
    
}
