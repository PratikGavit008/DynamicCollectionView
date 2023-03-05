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
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.blue.cgColor
        backView.layer.cornerRadius = 20
    }
}
