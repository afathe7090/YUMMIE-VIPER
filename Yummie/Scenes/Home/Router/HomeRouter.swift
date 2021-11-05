//
//  HomeRouter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import UIKit

class HomeRouter: HomeRouterProtocol{
    
    var view: UIViewController?
    
    var delegate: DishesDataComingProtocol?
    var listDelegate: ListDishesDataCommingFromListCollectionViewProtocol?
    
    static func creatModule()-> UIViewController{
        let view = HomeVC()
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        router.view = view
        interactor.presenter = presenter
        return view
    }
    
    
    func goToDishDetails(dish: Dish) {
        let vc = DishDetailRouter.creatModule() as! DishDetailVC
        delegate = vc
        delegate?.getDishes(dish: dish)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToListDishesView(foodDish: FoodDishCategory) {
        let vc = ListDishesRouter.createModule() as! ListDishesVC
        listDelegate = vc
        listDelegate?.fetchListDishedData(foodDish: foodDish)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func goToListOrdersVC(){
        let vc = ListOrdersRouter.creatModule()
        
        view?.navigationController?.pushViewController(vc, animated: true)
    }
   
}
