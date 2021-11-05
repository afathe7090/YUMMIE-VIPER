//
//  DishDetailPresenter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import Foundation


class DishDetailPresenter: DishDetailPresenterProtocol, DishDetailInteractorOutputProtocol{
    
    
    var dish: Dish?
    
    weak var view: DishDetailViewProtocol?
    var interactor: DishDetailInteractorInputProtocol?
    var router: DishDetailRouterProtocol?
    
    
    init(view: DishDetailViewProtocol, interactor: DishDetailInteractorInputProtocol, router: DishDetailRouterProtocol){
        
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    
    func viewDidLoad() {
        guard let dish = dish else {return}
        view?.setUIView(dish: dish)
    }
    
}


