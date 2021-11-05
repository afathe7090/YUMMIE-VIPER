//
//  ListDishesRouter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import UIKit

class ListDishesRouter: ListDishesRouterProtocol{
    
    var view: UIViewController?
    
    var delegate: DishesDataComingProtocol?
    
    static func createModule()-> UIViewController{
        let view = ListDishesVC()
        let router = ListDishesRouter()
        let interactor = ListDishesInteractor()
        let presenter = ListDishesPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        router.view = view
        interactor.presenter = presenter
        return view
    }
    
    
    func goToDishDetailViewController(dish: Dish){
        let VC = DishDetailRouter.creatModule() as! DishDetailVC
        delegate = VC
        delegate?.getDishes(dish: dish)
        view?.navigationController?.pushViewController(VC, animated: true)
    }
    
}
