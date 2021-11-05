//
//  DishDetailProtocols.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import Foundation

protocol DishDetailViewProtocol: AnyObject{
    var presenter: DishDetailPresenterProtocol! {get set}
    func setUIView(dish: Dish)
}


protocol DishDetailPresenterProtocol: AnyObject{
    var view: DishDetailViewProtocol? {get set}
    var dish: Dish? {get set}
    func viewDidLoad()
}


protocol DishDetailRouterProtocol{
    
}


protocol DishDetailInteractorInputProtocol: AnyObject{
    var presenter: DishDetailInteractorOutputProtocol? {get set}
}


protocol DishDetailInteractorOutputProtocol: AnyObject{
    
}


protocol DishesDataComingProtocol{
    func getDishes(dish: Dish)
}
