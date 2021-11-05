//
//  DishDetailRouter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import UIKit

class DishDetailRouter: DishDetailRouterProtocol{
    
    var view: UIViewController?
    
    static func creatModule()-> UIViewController{
        let view = DishDetailVC()
        let router = DishDetailRouter()
        let interactor = DishDetailInteractor()
        let presenter = DishDetailPresenter(view: view, interactor: interactor, router: router)

        router.view = view
        view.presenter = presenter
        presenter.router = router
        interactor.presenter = presenter
        return view
    }
}
