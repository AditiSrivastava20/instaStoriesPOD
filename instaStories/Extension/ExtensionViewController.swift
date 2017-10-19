//
//  ExtensionViewController.swift
//  instaStories
//
//  Created by Sierra 4 on 12/05/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//
import Foundation
import UIKit
import AVKit
import AVFoundation
import Fusuma
import Sharaku
import MobileCoreServices

//Mark: CollectionView Extension(ViewController).
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrStoryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:identifier.StoryCollViewCell.rawValue , for: indexPath) as! storyCollectionViewCell
        cell.imgStory.image = arrStoryImages[indexPath.row]
        cell.btnClickImage.tag = indexPath.item
        cell.lblName.text = arrNames[indexPath.row]
        cell.btnClickImage.addTarget(self, action: #selector(ViewController.btnAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    @IBAction func btnClickImage(_ sender: UIButton) {
    }
}

//Mark: Extension UIImagePickerController (ViewController).
extension ViewController:  UIImagePickerControllerDelegate ,UINavigationControllerDelegate
{
    func callImagePicker()
    {
        let profileImage = UIImagePickerController()
        profileImage.delegate = self
        profileImage.sourceType = UIImagePickerControllerSourceType.photoLibrary
        profileImage.mediaTypes = [kUTTypeMovie as String]
        profileImage.mediaTypes = [imagePickerCons.mediaTypeImage.rawValue , imagePickerCons.mediaTypeVideo.rawValue]
        profileImage.allowsEditing = false
        self.present(profileImage , animated: true) {
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker : UIImagePickerController , didFinishPickingMediaWithInfo info : [String : Any]) {
        mediaTypes = (info[UIImagePickerControllerMediaType] as! String)
        //Mark: For ImagePicker.
        if mediaTypes == kUTTypeImage as String
        {
            imgPicker = (info[UIImagePickerControllerOriginalImage] as! UIImage)
            storyImagesArray.append(imgPicker as Any)
            picker.dismiss(animated: true, completion: nil)
            let vc = SHViewController(image: imgPicker!)
            vc.delegate = self
            self.present(vc, animated:true, completion: nil)
        }
        //Mark: For VideoPicker.
        if mediaTypes == kUTTypeVideo as String || mediaTypes == kUTTypeMovie as String
        {
            VideoUrl = (info[UIImagePickerControllerMediaURL] as! URL)
            storyImagesArray.append(VideoUrl as Any)
            picker.dismiss(animated: true, completion: nil)
        }
        else
        {
            print(printData.error.rawValue)
        }
    }
}

//Mark: Extension Fusuma Delegate (ViewController).
extension ViewController:FusumaDelegate{
    func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode) {
        <#code#>
    }
    
    func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        storyImagesArray.append(image)
    }
    
    func fusumaDismissedWithImage(_ image: UIImage, source: FusumaMode) {
      
        let vc = SHViewController(image: image)
        vc.delegate = self
        self.present(vc, animated:true, completion: nil)
    }
    
    func fusumaCameraRollUnauthorized() {
    }
    
    func fusumaVideoCompleted(withFileURL fileURL: URL) {
        storyImagesArray.append(fileURL)
    }
}


//Mark: Extension SHViewControllerDelegate (ViewController).
extension ViewController: SHViewControllerDelegate {
    
    func shViewControllerImageDidFilter(image: UIImage) {
        storyImagesArray.removeLast()
        storyImagesArray.append(image)
    }
    
    func shViewControllerDidCancel() {
        // This will be called when you cancel filtering the image.
    }
}
