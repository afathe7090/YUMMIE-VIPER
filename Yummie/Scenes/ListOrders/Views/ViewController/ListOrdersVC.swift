//
//  ListOrdersVC.swift
//  Yummie
//
//  Created by Ahmed Fathy on 15/10/2021.
//

import UIKit

class ListOrdersVC: UIViewController, ListOrdersViewProtocol {
    
    var presenter: ListOrdersPresernterProtocol!    
    
    //MARK: - OutLets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
       
    }

    
    //MARK: - Helper FUnctions
    
    
    private func configureUI(){
        title = presenter.titleView
    }
    
    
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: ListDishesCell.id, bundle: nil), forCellReuseIdentifier: ListDishesCell.id)
    }
}
