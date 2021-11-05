//
//  ListOrdersPresenter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 15/10/2021.
//

import Foundation


class ListOrdersPresenter: ListOrdersPresernterProtocol, ListOrdersInteractorOutputProtocol{    
    
    weak var view: ListOrdersViewProtocol?
    var router: ListOrdersRouterProtocol?
    var interactor: ListOrderInteractorInputProtocol?
    
    init(view: ListOrdersViewProtocol, router: ListOrdersRouterProtocol, interactor: ListOrderInteractorInputProtocol){
        self.router = router
        self.view = view
        self.interactor = interactor
    }
    
    
    var orders: [Order] = [.init(id: "", name: "Order", dish: Dish(id: "1", name: "Gerri", description: " this is the best i                         have ever tested", image: imageAddres, calories: 34.23235265)),
                           .init(id: "", name: "Order", dish: Dish(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265)),
                           .init(id: "", name: "Order", dish: Dish(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265))]
    
    
    
    var numberOfRows: Int{
        return orders.count
    }
    
    
    var titleView: String{
        return "Orders"
    }
    
    
    
    func didSelectRowAt(index: IndexPath){
        if let dish = orders[index.row].dish{
            router?.fetchListOrderToDeltailVC(dish: dish)
        }
    }
    
    
    func configureTableViewCell(cell: ListDishesCell, index: IndexPath){
        let order = orders[index.row]
        cell.setListOrderDishes(viewModel: order)
    }
    
    
}
