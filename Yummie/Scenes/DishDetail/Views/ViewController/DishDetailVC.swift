//
//  DishDetailVC.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import UIKit
import Kingfisher

class DishDetailVC: UIViewController, DishDetailViewProtocol {

    
    var presenter: DishDetailPresenterProtocol!
    
    
    //MARK: - Outlet
    
    @IBOutlet weak var dishImageVuew: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var placeOrderButtonPressed: UIButton!{didSet{placeOrderButtonPressed.layer.cornerRadius = 10}}
    
    
    //MARK: - Lyfe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
    }
    
    
    func setUIView(dish: Dish) {
        titleLbl.text = dish.name
        caloriesLbl.text = "\(dish.calories ?? 0)"
        descriptionLbl.text = dish.description
        dishImageVuew.kf.setImage(with: dish.image?.asURL)
    }
    
    
    
}

extension DishDetailVC: DishesDataComingProtocol{
    func getDishes(dish: Dish) {
        presenter.dish = dish
    }
}

