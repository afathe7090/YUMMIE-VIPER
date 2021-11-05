//
//  HomeProtocols.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import Foundation

protocol HomeViewProtocol: AnyObject{
    var presenter: HomePresenterProtocol! {get set}
   
}

protocol HomePresenterProtocol: AnyObject{
    var view: HomeViewProtocol? {get set}
        
    var categoryNumberOfRows: Int { get }
    var popularNumberOfRows: Int  { get }
    var chefNumberOfRows: Int     { get }
    
    func categoryDishDidSelected(index: IndexPath)
    func popularDishDidSelected(index: IndexPath)
    func dishDidSelected(index: IndexPath)
    
    func categoreModule(cell: FoodDishCategoryProtocol ,index: IndexPath)
    func popularModule(cell: PopularDishProtocol ,index: IndexPath)
    func chefModule(cell: ChefDishProtocol, index: IndexPath)
    
    func tabBarButtonActionGoToListOrdersVC()
}

protocol HomeRouterProtocol{
    func goToListDishesView(foodDish: FoodDishCategory)
    func goToDishDetails(dish: Dish)
    func goToListOrdersVC()
}

protocol HomeInteractorInputProtocol: AnyObject{
    var presenter: HomeInteractorOutputProtocol? {get set}
    var ApiDataManager: HomeInteractorApiDataMangerProtocols? {get set}
    
}


protocol HomeInteractorOutputProtocol: AnyObject{
}


protocol HomeInteractorApiDataMangerProtocols: AnyObject{
    func getDataFromApiServices(commpletion: @escaping([Dish],Error?)->Void)
}



protocol FoodDishCategoryProtocol{
    func setUpCell(category: FoodDishCategory)
}


protocol PopularDishProtocol{
    func setUpCell(popularDish: Dish)
}

protocol ChefDishProtocol{
    func setUpCell(chefDish: Dish)
}
