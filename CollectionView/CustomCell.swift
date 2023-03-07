//
//  CustomCell.swift
//  CollectionView
//
//  Created by Pratik Gavit on 03/03/23.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
//        backView.layer.borderWidth = 1
//        backView.layer.borderColor = UIColor.blue.cgColor
//        backView.layer.cornerRadius = 20
        
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        img.layer.shadowColor = UIColor.black.cgColor
        img.layer.shadowOffset = CGSize(width: 0, height: 0)
        img.layer.shadowOpacity = 0.5
        img.layer.shadowRadius = 2
        img.layer.masksToBounds = false
    }
}
