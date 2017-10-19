//
//  ExtensionInstagramStoryViewController.swift
//  instaStories
//
//  Created by Sierra 4 on 12/05/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

//Mark: CollectionView Extension.(InstagramStoryViewController)
extension InstagramStoryViewController:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return instaStoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:identifier.showStoryCollViewCell.rawValue , for: indexPath) as! ShowStoryCollectionCell
        if let data = instaStoryArray[indexPath.item] as? UIImage{
            cell.imgStoryShow.image = data
            cell.viewVideoShow.isHidden = true
        }
        else{
            cell.imgStoryShow.isHidden = true
            let playerL = AVPlayer(url: instaStoryArray[indexPath.row] as! URL)
            player = AVPlayerLayer(player: playerL)
            player?.frame = cell.viewVideoShow.bounds
            cell.viewVideoShow.layer.addSublayer(player!)
            playerL.play()
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.frame.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath: IndexPath = collectionView.indexPathForItem(at: visiblePoint)!
        print(visibleIndexPath)
        spb.skip()
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width:(self.collectionView.frame.width), height: (self.collectionView.frame.height))
    }
}

//Mark: segmented Progress Bar(ExtensionInstagramStoryViewController).
extension InstagramStoryViewController : SegmentedProgressBarDelegate {
    func segmentedProgressBarChangedIndex(index: Int) {
        print("",index)
        let indexPath = IndexPath(item: index, section: 0)
        self.collectionView.scrollToItem(at:indexPath, at: UICollectionViewScrollPosition.right, animated: true)
    }
    
    func segmentedProgressBarFinished() {
    self.navigationController?.popViewController(animated: true)
        
    }
    
    func segmentProgressBarInfo()
    {
        spb = SegmentedProgressBar(numberOfSegments: instaStoryArray.count, duration: 5)
        spb.frame = CGRect(x: 15, y: 15, width: view.frame.width - 30, height: 2)
        spb.delegate = self
        spb.topColor = UIColor.white
        spb.bottomColor = UIColor.white.withAlphaComponent(0.25)
        spb.padding = 2
        view.addSubview(spb)
        spb.startAnimation()
    }
}
