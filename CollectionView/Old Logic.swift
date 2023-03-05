//
//  Old Logic.swift
//  CollectionView
//
//  Created by Pratik Gavit on 05/03/23.
//

import Foundation

//    var scrollTimer: Timer?

//    func startScrolling() {
//        scrollTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(scrollCollectionView), userInfo: nil, repeats: true)
//    }

//    @objc func scrollCollectionView() {
//        guard let collectionView = collectionView else { return }
//        let currentOffset = collectionView.contentOffset
//        let width = (collectionView.frame.width / noOfCell) - 10 - 10/noOfCell
//        let newOffset = CGPoint(x: currentOffset.x + collectionView.frame.size.width, y: currentOffset.y)
//        if newOffset.x > collectionView.contentSize.width - collectionView.frame.size.width {
//            collectionView.setContentOffset(CGPoint.zero, animated: true)
//        } else {
//            collectionView.setContentOffset(newOffset, animated: true)
//        }
//    }
//    @objc func scrollCollectionView() {
//        guard let collectionView = collectionView else { return }
//        let currentOffset = collectionView.contentOffset
//        let width = (collectionView.frame.width / noOfCell) - 10 - 10/noOfCell
//        var newOffset: CGPoint
//
//        if isScrollingForward {
//            newOffset = CGPoint(x: currentOffset.x + collectionView.frame.size.width, y: currentOffset.y)
//            if newOffset.x > collectionView.contentSize.width - collectionView.frame.size.width {
//                isScrollingForward = false
//                newOffset = CGPoint(x: currentOffset.x - width, y: currentOffset.y)
//            }
//        } else {
//            newOffset = CGPoint(x: currentOffset.x - width, y: currentOffset.y)
//            if newOffset.x < 0 {
//                isScrollingForward = true
//                newOffset = CGPoint(x: currentOffset.x + collectionView.frame.size.width, y: currentOffset.y)
//            }
//        }
//
//        collectionView.setContentOffset(newOffset, animated: true)
//    }
