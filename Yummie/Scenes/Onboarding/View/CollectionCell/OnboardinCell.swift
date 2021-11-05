//
//  OnboardinCell.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import UIKit

class OnboardinCell: UICollectionViewCell, OnboardingCollectionCellProtocol {
    
    static let id = "OnboardinCell"
    
    
    @IBOutlet weak var onboardingImage: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    func slideSetUp(_ slide: OnboardingSlide){
        self.onboardingImage.image = slide.image
        self.slideTitleLabel.text = slide.title
        self.slideDescriptionLabel.text = slide.description
    }
    
    
}
