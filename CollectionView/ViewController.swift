//
//  ViewController.swift
//  CollectionView
//
//  Created by Pratik Gavit on 03/03/23.
//

import UIKit

class ViewController: UIViewController {
   
    let noOfCell:CGFloat = 4
    let spacingBetweenCells:CGFloat = 5
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let arr = ["doc.fill","trash","folder","tray","doc","ticket","trash","folder","tray","doc","ticket","trash","folder","tray","doc.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewHeight.constant = collectionView.frame.width / noOfCell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startScrolling()
    }
    
    
    var isScrollingForward = true
    func startScrolling() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.autoScrollCollectionView(self.collectionView)
        }
    }

    
    @objc func autoScrollCollectionView(_ collectionView: UICollectionView) {
        let currentOffset = collectionView.contentOffset
        let width = (collectionView.frame.width / noOfCell) + spacingBetweenCells/noOfCell
        var newOffset: CGPoint
        
        if isScrollingForward {
            newOffset = CGPoint(x: currentOffset.x + width, y: currentOffset.y)
            if newOffset.x > collectionView.contentSize.width - collectionView.frame.size.width {
                isScrollingForward = false
                newOffset = CGPoint(x: currentOffset.x - width, y: currentOffset.y)
            }
        } else {
            newOffset = CGPoint(x: currentOffset.x - width, y: currentOffset.y)
            if newOffset.x < 0 {
                isScrollingForward = true
                newOffset = CGPoint(x: currentOffset.x + width, y: currentOffset.y)
            }
        }
        collectionView.setContentOffset(newOffset, animated: true)
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell else { fatalError() }
        cell.img.image = UIImage(systemName: arr[indexPath.row])
        return cell
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width / noOfCell) - spacingBetweenCells + spacingBetweenCells/noOfCell
//        let height = collectionView.frame.height
        return CGSize(width: width , height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingBetweenCells
    }
    
}
