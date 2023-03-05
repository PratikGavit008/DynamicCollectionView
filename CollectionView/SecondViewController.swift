//
//  SecondViewController.swift
//  CollectionView
//
//  Created by Pratik Gavit on 05/03/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        myView.addGestureRecognizer(tapGesture)
    }
 
    
    @objc func viewTapped() {
       if myView.backgroundColor == UIColor.red {
          myView.backgroundColor = UIColor.blue
          myView.layer.cornerRadius = 20.0
          myView.layer.borderWidth = 5.0
          myView.layer.borderColor = UIColor.green.cgColor
       } else {
          myView.backgroundColor = UIColor.red
          myView.layer.cornerRadius = 10.0
          myView.layer.borderWidth = 2.0
          myView.layer.borderColor = UIColor.black.cgColor
       }
    }


}
