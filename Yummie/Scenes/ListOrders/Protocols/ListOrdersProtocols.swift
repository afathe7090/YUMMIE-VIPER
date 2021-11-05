//
//  ListOrdersProtocols.swift
//  Yummie
//
//  Created by Ahmed Fathy on 15/10/2021.
//

import Foundation

protocol ListOrdersViewProtocol: AnyObject{
    var presenter: ListOrdersPresernterProtocol! {get set}
}

protocol ListOrdersPresernterProtocol: AnyObject{
    var numberOfRows: Int            {get}
    var titleView: String             {get}
    var view: ListOrdersViewProtocol? {get set}
    func didSelectRowAt(index: IndexPath)
    func configureTableViewCell(cell: ListDishesCell, index: IndexPath)
}

protocol ListOrdersRouterProtocol {
    func fetchListOrderToDeltailVC(dish: Dish)
}

protocol ListOrderInteractorInputProtocol{
    var presenter: ListOrdersInteractorOutputProtocol? {get set}
}

protocol ListOrdersInteractorOutputProtocol: AnyObject{
    
}


protocol ListOrdersTableViewCell{
    func setListOrderDishes(viewModel: Order)
}
