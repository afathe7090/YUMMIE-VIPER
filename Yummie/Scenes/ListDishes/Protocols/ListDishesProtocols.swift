//
//  ListDishesProtocols.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import Foundation


protocol ListDishesViewProtocol: AnyObject{
    var presenter: ListDishesPresenterProtocol! {get set}
    func setTitleView(_ title: String)
}

protocol ListDishesPresenterProtocol: AnyObject {
    var view: ListDishesViewProtocol? {get set}
    var numberOfRows: Int {get}
    func viewDidLoad()
    func dishDidSelect(index: IndexPath)
    func getDishDataFromProtocolCommingInViewController(foodDish: FoodDishCategory)
    func configureCell(cell: ListDishesCell, index: IndexPath)
}

protocol ListDishesRouterProtocol{
    func goToDishDetailViewController(dish: Dish)
}


protocol ListDishesInteractorInputProtocol: AnyObject {
    var presenter: ListDishesInteractorOutputProtocol? {get set}
}


protocol ListDishesInteractorOutputProtocol: AnyObject {
    
}


protocol ListDishesDataCommingFromListCollectionViewProtocol{
    func fetchListDishedData(foodDish: FoodDishCategory)
}


protocol ListDishesCellProtocol{
    func setUICell(viewModel: Dish)
}
