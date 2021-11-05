//
//  OnboardingProtocols.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import Foundation


protocol OnboardingViewProtocol: AnyObject {
    var presenter: OnboardingPresenterProtocol! {get set}
    func currentPage(_ num: Int)
    func nextButtonSetTitle(_ str: String)
    func getZoomCollectionIndex(_ index: IndexPath)
}

protocol OnboardingPresenterProtocol: AnyObject{
    var view: OnboardingViewProtocol? {get set}
    var currentPage: Int { get set }
    func numberOfRows()->Int
    func viewDidLoad()
    func nextActionButton()
    func scrollViewDidScroll(_ num: Int)
    func configureCell(cell: OnboardingCollectionCellProtocol , index: IndexPath)
}


protocol OnboardingRouterProtocol{
    func goToHome()
}


protocol OnboardingInteractorInputProtocol: AnyObject{
    var presenter: OnboardingInteractorOutputProtocol? {get set}
}


protocol OnboardingInteractorOutputProtocol: AnyObject{
}

protocol OnboardingCollectionCellProtocol{
    func slideSetUp(_ slide: OnboardingSlide)
}

