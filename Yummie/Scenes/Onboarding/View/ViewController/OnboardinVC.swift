//
//  OnboardingVC.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import UIKit

class OnboardingVC: UIViewController, OnboardingViewProtocol  {
   
   
    //MARK: - Variables
    
    var presenter: OnboardingPresenterProtocol!
        
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var paggingControl: UIPageControl!
    @IBOutlet weak var nextButtonPressed: UIButton!{didSet {nextButtonPressed.layer.cornerRadius = 10 }}
    
    
    
    //MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        presenter.viewDidLoad()
        configureCollectionView()
    }
    
    //MARK: - Actions
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        presenter.nextActionButton()
    }
    
    
    //MARK: - Helper Function
    
    private func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: OnboardinCell.id, bundle: nil)
                                , forCellWithReuseIdentifier: OnboardinCell.id)
    }

    //MARK: - Fetch Onboarding
    
    func currentPage(_ num: Int) {
        paggingControl.currentPage = num
    }
    
    
    func nextButtonSetTitle(_ str: String) {
        nextButtonPressed.setTitle(str, for: .normal)
    }
    
    
    func getZoomCollectionIndex(_ index: IndexPath) {
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }

}
