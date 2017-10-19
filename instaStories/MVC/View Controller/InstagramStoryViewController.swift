//
//  InstagramStoryViewController.swift
//  instaStories
//
//  Created by Sierra 4 on 10/05/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class InstagramStoryViewController: UIViewController {
    
    //Mark:Outlets and Variables
    @IBOutlet weak var collectionView: UICollectionView!
    var spb: SegmentedProgressBar!
    var instaStoryArray = [Any]()
    var player:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print(instaStoryArray)
        segmentProgressBarInfo()
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }

}

