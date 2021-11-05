//
//  ListOrdersRouter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 15/10/2021.
//

import UIKit

class ListOrdersRouter: ListOrdersRouterProtocol{
    
    var view: UIViewController?
    var delegate: DishesDataComingProtocol?
    
    
    static func creatModule()-> UIViewController{
        let view = ListOrdersVC()
        let router = ListOrdersRouter()
        let interactor = ListOrdersInteractor()
        let presenter = ListOrdersPresenter(view: view, router: router, interactor: interactor)
        router.view = view
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}


extension ListOrdersRouter{
    func fetchListOrderToDeltailVC(dish: Dish){
        let vc = DishDetailRouter.creatModule() as! DishDetailVC
        delegate = vc
        delegate?.getDishes(dish: dish)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
