//
//  HomePresenter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import Foundation

class HomePresenter: HomePresenterProtocol,HomeInteractorOutputProtocol{
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    var catego: [FoodDishCategory] = [
        .init(id: "", name: "AficaDish1", image: imageAddres),
        .init(id: "", name: "AficaDish2", image: imageAddres),
        .init(id: "", name: "AficaDish3", image: imageAddres),
        .init(id: "", name: "AficaDish4", image: imageAddres),
        .init(id: "", name: "AficaDish5", image: imageAddres)]
    
    var popular:[Dish] = [
        .init(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Indoem", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Ahmed", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Nonoi", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
    ]
    
    var chefDish:[Dish] = [
        .init(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Indoem", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Ahmed", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Nonoi", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265)
    ]
    
    
    var categoryNumberOfRows: Int{
        return catego.count
    }
    var popularNumberOfRows: Int{
        return popular.count
    }
    var chefNumberOfRows:Int {
        return chefDish.count
    }
    
    
    
    func categoreModule(cell: FoodDishCategoryProtocol ,index: IndexPath){
        let category = catego[index.row]
        cell.setUpCell(category: category)
    }
    
    
    func popularModule(cell: PopularDishProtocol ,index: IndexPath){
        let popularDish = popular[index.row]
        cell.setUpCell(popularDish: popularDish)
    }
    
    func chefModule(cell: ChefDishProtocol, index: IndexPath){
        let chefDish = chefDish[index.row]
        cell.setUpCell(chefDish: chefDish)
    }
    
    
    func categoryDishDidSelected(index: IndexPath){
        let dishCategory = catego[index.row]
        router?.goToListDishesView(foodDish: dishCategory)
    }
    
    
    func dishDidSelected(index: IndexPath) {
        let dish = chefDish[index.row]
        router?.goToDishDetails(dish: dish)
    }
    
    
    func popularDishDidSelected(index: IndexPath) {
        let dish = popular[index.row]
        router?.goToDishDetails(dish: dish)
    }
    
    
    func tabBarButtonActionGoToListOrdersVC(){
        router?.goToListOrdersVC()
    }
    
    
}
