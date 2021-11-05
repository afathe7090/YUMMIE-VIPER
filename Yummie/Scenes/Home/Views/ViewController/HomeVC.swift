//
//  HomeVC.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import UIKit


class HomeVC: UIViewController, HomeViewProtocol {
   
    
    var presenter: HomePresenterProtocol!
    
   
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var foodTableViewCell: UITableViewCell!
    @IBOutlet var popularDishesTableCell: UITableViewCell!
    @IBOutlet var chefTableViewCell: UITableViewCell!
    
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var chefCollectionView: UICollectionView!
    
    
    
    
    
    
    //MARK: - Lyfe cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigigationBarController()
        configureTableAndCollectionView()
    }
    
    
    
    
    
    //MARK: - Helper Functions
    
    //MARK: - ViewController Functions
    private func configureNavigigationBarController(){
        title = "Yummie"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 25, weight: .semibold)]
        
        configureBarButtonItem()
        
    }
    
    
    private func configureTableAndCollectionView(){
        configureTableView()
        configureFoodCollectionView()
        configurePopularCollectionView()
        configureChefCollectionViewCell()
    }
    
    
    
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    
    private func configureFoodCollectionView(){
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        foodCollectionView.register(UINib(nibName: FoodCategoryCell.id, bundle: nil), forCellWithReuseIdentifier: FoodCategoryCell.id)
    }
    
    
    private func configurePopularCollectionView(){
        
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.register(UINib(nibName: PopularDishesCell.id, bundle: nil), forCellWithReuseIdentifier: PopularDishesCell.id)
    }
    
    
    private func configureChefCollectionViewCell(){
        chefCollectionView.delegate = self
        chefCollectionView.dataSource = self
        chefCollectionView.register(UINib(nibName: ChefPortraitCell.id, bundle: nil), forCellWithReuseIdentifier: ChefPortraitCell.id)
    }
    
        
    
    //MARK: - Bar Button
    private func configureBarButtonItem(){
        let btn = UIBarButtonItem(image: UIImage(systemName: "cart.circle.fill"), style: .done, target: self, action: #selector(barButtonAction))
        btn.tintColor = #colorLiteral(red: 0.8771330714, green: 0.2273131013, blue: 0, alpha: 1)
        self.navigationItem.rightBarButtonItem = btn
    }
    
    @objc func barButtonAction(){
        presenter.tabBarButtonActionGoToListOrdersVC()
    }
    
}
