//
//  HomeVC+Extentions.swift
//  Yummie
//
//  Created by Ahmed Fathy on 11/10/2021.
//

import UIKit



//MARK: - TableView Extentions

//MARK: - UITableViewDataSource

extension HomeVC: UITableViewDataSource {
        
    //----------------------------------------------------------------------------------------------------------------
    //=======> Number of Sections
    //----------------------------------------------------------------------------------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======> Number Of Rows
    //----------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======> Cell For rows
    //----------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) && (indexPath.row == 0) { return foodTableViewCell}
        if (indexPath.section == 1) && (indexPath.row == 0) { return popularDishesTableCell}
        if (indexPath.section == 2) && (indexPath.row == 0) { return chefTableViewCell}
        
        return UITableViewCell()
    }
    
}


//MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate{
    
    //----------------------------------------------------------------------------------------------------------------
    //=======> Height For RowAt
    //----------------------------------------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ( indexPath.section == 0 ) && ( indexPath.row == 0 ) { return HEIGHTSCREEN / 4.8}
        if ( indexPath.section == 1 ) && ( indexPath.row == 0 ) { return HEIGHTSCREEN / 2.4}
        if ( indexPath.section == 2 ) && ( indexPath.row == 0 ) { return HEIGHTSCREEN / 5.4}
        return HEIGHTSCREEN / 4.8
    }
    
    
}



//MARK: - CollectionVeiw Extention


//MARK: - UICollectionViewDelegate

extension HomeVC:  UICollectionViewDataSource {
    
    //----------------------------------------------------------------------------------------------------------------
    //=======> number Of Section
    //----------------------------------------------------------------------------------------------------------------
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======> number of Rows
    //----------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if ( collectionView == foodCollectionView){ return presenter.categoryNumberOfRows}
        if ( collectionView == popularCollectionView){ return presenter.popularNumberOfRows}
        if ( collectionView == chefCollectionView){ return presenter.chefNumberOfRows}
        
        return 5
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======> Cell For RowAt
    //----------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // =======>>>>> Food Category CollectionView Cells
        if (collectionView == foodCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCategoryCell.id, for: indexPath) as! FoodCategoryCell
            
            presenter.categoreModule(cell: cell, index: indexPath)
            return cell
        }
        
        // =======>>>>> Popular Dishs Collection View Cells
        if (collectionView == popularCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishesCell.id, for: indexPath) as! PopularDishesCell
            presenter.popularModule(cell: cell, index: indexPath)
            return cell
        }
        
        
        // =======>>>>> Chef CollectionView
        if (collectionView == chefCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefPortraitCell.id, for: indexPath) as! ChefPortraitCell
            presenter.chefModule(cell: cell, index: indexPath)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    
}


//MARK: - UICollectionViewDelegateFlowLayout

extension HomeVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if  (collectionView == foodCollectionView ){ return CGSize (width: WIDTHSCREEN / 2.3, height: HEIGHTSCREEN / 13)}
        if  (collectionView == popularCollectionView ){ return CGSize (width: WIDTHSCREEN / 2.1, height: HEIGHTSCREEN / 2.8)}
        if  (collectionView == chefCollectionView ){ return CGSize (width: WIDTHSCREEN - 75, height: HEIGHTSCREEN / 9)}
        
        return CGSize(width: 175, height: 60)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == foodCollectionView){presenter.categoryDishDidSelected(index: indexPath)}
        if (collectionView == popularCollectionView){presenter.popularDishDidSelected(index: indexPath)}
        if (collectionView == chefCollectionView){presenter.dishDidSelected(index: indexPath)}
    }
    
}
