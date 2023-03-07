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
        collectionViewHeight.constant = collectionView.frame.width / noOfCell + 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        startScrolling()
        startTimer()
        addNavBarImage()
    }
    func addNavBarImage() {
            let navController = navigationController!
            let image = UIImage(named: "logoSelfdrive") //Your logo url here
            let imageView = UIImageView(image: image)
//        let bannerWidth:CGFloat = 180
            let bannerHeight = navController.navigationBar.frame.size.height - 10

//        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
      
        
        let imageBarButtonItem = UIBarButtonItem(customView: imageView)
        navigationItem.leftBarButtonItem = imageBarButtonItem
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: navigationItem.leftBarButtonItem!.customView!.leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: navController.navigationBar.frame.height - 10)
        ])
        
    }
    
    
    func startTimer() {
        let timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }


    @objc func scrollAutomatically(_ timer1: Timer) {

        if let coll  = collectionView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)! < arr.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)

                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }

            }
        }
        
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
}
