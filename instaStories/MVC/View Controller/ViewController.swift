//
//  ViewController.swift
//  instaStories
//
//  Created by Sierra 4 on 10/05/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import UIKit
import Fusuma
import Sharaku
import AVKit
import AVFoundation
import MobileCoreServices


class ViewController: UIViewController{
    
    //Mark:Outlets and Variables.
    @IBOutlet weak var collectionView: UICollectionView!
    var arrStoryImages = [#imageLiteral(resourceName: "camera"),#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img4"),#imageLiteral(resourceName: "img5"),#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img2"),#imageLiteral(resourceName: "img3"),#imageLiteral(resourceName: "img4"),#imageLiteral(resourceName: "img5"),#imageLiteral(resourceName: "img1"),#imageLiteral(resourceName: "img2")]
    var arrNames = [printData.addStory.rawValue,printData.palak.rawValue, printData.apurva.rawValue, printData.aditi.rawValue ,printData.Priyanka.rawValue,printData.Kanchan.rawValue, printData.apurva.rawValue, printData.palak.rawValue, printData.aditi.rawValue ,printData.Priyanka.rawValue,printData.Kanchan.rawValue,printData.palak.rawValue]
    let fusuma = FusumaViewController()
    var storyImagesArray = [Any]()
    var flag = 0
    var mediaTypes:String?
    var VideoUrl:URL?
    var imgPicker:UIImage?
    var arrAllMedia : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fusuma.delegate = self
    }
    
    //Mark:Btn Action to add story.
    @IBAction func btnAddStory(_ sender: UIButton) {
        fusuma.hasVideo = true
        self.present(fusuma, animated: true, completion: nil)
    }
    
    
    //Mark:BtnAction in collectionView for different conditions.
    func btnAction(sender:UIButton)
    {
        if sender.tag == 0{
             callImagePicker()
        }
        else if storyImagesArray.count > 0{
            performSegue(withIdentifier: identifier.segueIdentifier.rawValue, sender: self)
        }
        else if storyImagesArray.count == 0{
            alertBox(printData.NoStoryToDisplay.rawValue, obj: self)
        }
    }
    
    //Mark:Segue transfer data.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == identifier.segueIdentifier.rawValue
        {
            let showDatavc : InstagramStoryViewController = segue.destination as!  InstagramStoryViewController
            showDatavc.instaStoryArray = storyImagesArray
        }
    }
    }

