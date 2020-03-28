//
//  CategoryCollectionViewCell.swift
//  Market
//
//  Created by Arwa Mahdai on 3/19/20.
//  Copyright © 2020 Arwa Mahdai. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func generateCell(_ category: Category) {
        nameLabel.text = category.name
        imageView.image = category.image
        
    }
    
    
    
    
    
}
