//
//  OnboardingVC + Extension.swift
//  Yummie
//
//  Created by Ahmed Fathy on 13/10/2021.
//

import UIKit

//MARK: -  Extentions
 
extension OnboardingVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    //MARK: - Number Of Items in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    
    //MARK: - Cell For Row At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardinCell.id, for: indexPath) as! OnboardinCell
        presenter.configureCell(cell: cell, index: indexPath)
        return cell
    }
    
    //----------------------------------------------------------------------------------------------------------------
    //=======> Size Fo Items
    //----------------------------------------------------------------------------------------------------------------
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    //----------------------------------------------------------------------------------------------------------------
    //=======> scrollViewDidScroll
    //----------------------------------------------------------------------------------------------------------------
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let curentPage = Int(scrollView.contentOffset.x / width)
        presenter.scrollViewDidScroll(curentPage)
        
    }
}
