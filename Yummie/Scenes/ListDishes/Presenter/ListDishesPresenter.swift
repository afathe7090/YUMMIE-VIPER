//
//  ListDishesPresenter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import Foundation


class ListDishesPresenter: ListDishesPresenterProtocol, ListDishesInteractorOutputProtocol{
    
    //MARK: - Protocols Instance
    weak var view: ListDishesViewProtocol?
    var router: ListDishesRouterProtocol?
    var interactor: ListDishesInteractorInputProtocol?
    
    
    //MARK: -  Var
    private var foodDish: FoodDishCategory?
    
    private var dishes:[Dish] = [
        .init(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Indoem", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Ahmed", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Nonoi", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265),
        .init(id: "1", name: "Gerri", description: " this is the best i have ever tested", image: imageAddres, calories: 34.23235265)
    ]
    
    
    var numberOfRows: Int {
        return dishes.count
    }
    
    
    
    //MARK: -  Init
    init(view: ListDishesViewProtocol , interactor: ListDishesInteractorInputProtocol , router: ListDishesRouterProtocol){
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - ViewDidLoad
    func viewDidLoad() {
        view?.setTitleView(foodDish?.name ?? "")
    }
    
    //MARK: - data Food dish
    func getDishDataFromProtocolCommingInViewController(foodDish: FoodDishCategory) {
        self.foodDish  = foodDish
    }
    
    //MARK: - ConfigureCell
    func configureCell(cell: ListDishesCell, index: IndexPath) {
        let dish = dishes[index.row]
        cell.setUICell(viewModel: dish)
    }
    
    //MARK: - didSelect
    
    func dishDidSelect(index: IndexPath){
        let dish = dishes[index.row]
        router?.goToDishDetailViewController(dish: dish)
    }
    
}
