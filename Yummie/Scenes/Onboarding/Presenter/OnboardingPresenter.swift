//
//  OnboardingPresenter.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import Foundation

class OnboardingPresenter: OnboardingPresenterProtocol , OnboardingInteractorOutputProtocol{
    
    weak var view: OnboardingViewProtocol?
    
    var currentPage: Int = 0 {
        didSet {
            view?.currentPage(currentPage)
            if currentPage == slides.count - 1 {
                view?.nextButtonSetTitle("Get Started")
            }else{
                view?.nextButtonSetTitle("Next")
            }
        }
    }
    
    private let interactor: OnboardingInteractorInputProtocol
    private let router: OnboardingRouterProtocol?
    private var slides:[OnboardingSlide] = []
    
    
    //MARK: - Init
    init(view: OnboardingViewProtocol, interactor: OnboardingInteractorInputProtocol , router: OnboardingRouter){
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    
    //MARK: - view Did Load
    func viewDidLoad() {
        fetchData()
    }
    
    
    
    //MARK: - Number of rows
    func numberOfRows() -> Int {
        return slides.count
    }
    
    
    
    //MARK: - Next Button Action
    func nextActionButton(){
        if currentPage == slides.count - 1 {
            //Note : Go to Home
            router?.goToHome()
        }else{
            currentPage += 1
            let index = IndexPath(item: currentPage, section: 0)
            view?.getZoomCollectionIndex(index)
        }
    }
    
    
    
    //MARK: - Configure Cell
    func configureCell(cell: OnboardingCollectionCellProtocol, index: IndexPath) {
        let slide = slides[index.row]
        cell.slideSetUp(slide)
    }
    
    
    //MARK: - Scroll View Did scroll
    func scrollViewDidScroll(_ num: Int){
        currentPage = num
        view?.currentPage(currentPage)
    }
    
    
    
    //MARK: - Fetch data
    private func fetchData(){
        slides.removeAll()
        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
        
    }
    
}
