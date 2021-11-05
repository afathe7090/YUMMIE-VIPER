//
//  ListDishesVC.swift
//  Yummie
//
//  Created by Ahmed Fathy on 12/10/2021.
//

import UIKit

class ListDishesVC: UIViewController , ListDishesViewProtocol{

    var presenter: ListDishesPresenterProtocol!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        configureTableView()
    }
   
    //MARK: - Set Title
    func setTitleView(_ title: String) {
        self.title = title
    }

    
    //MARK: -  Helper Functions
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ListDishesCell.id, bundle: nil), forCellReuseIdentifier: ListDishesCell.id)
    }
    

}


extension ListDishesVC: ListDishesDataCommingFromListCollectionViewProtocol{
    func fetchListDishedData(foodDish: FoodDishCategory) {
        print(foodDish)
        presenter.getDishDataFromProtocolCommingInViewController(foodDish: foodDish)
    }
    
    
}
