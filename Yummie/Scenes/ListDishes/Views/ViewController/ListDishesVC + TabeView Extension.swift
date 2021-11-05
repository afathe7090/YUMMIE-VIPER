//
//  ListDishesVC + Extension.swift
//  Yummie
//
//  Created by Ahmed Fathy on 15/10/2021.
//

import UIKit

extension ListDishesVC: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListDishesCell.id, for: indexPath) as! ListDishesCell
        
        presenter.configureCell(cell: cell, index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HEIGHTSCREEN / 8
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.dishDidSelect(index: indexPath)
    }
}
