//
//  OnboardingRouter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import UIKit

class OnboardingRouter: OnboardingRouterProtocol{
    
    var view: UIViewController?
    
    static func creatModule()-> UIViewController{
        let view = OnboardingVC()
        let router = OnboardingRouter()
        let interactor = OnboardingInteractor()
        
        let presenter = OnboardingPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        router.view = view
        interactor.presenter = presenter
        return view
    }
    
    func goToHome() {
        let vc = UINavigationController(rootViewController: HomeRouter.creatModule())
        vc.navigationBar.tintColor = .black
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        view?.present(vc, animated: true, completion: nil)
    }
    
}
