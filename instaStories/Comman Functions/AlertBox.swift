//
//  AlertBox.swift
//  instaStories
//
//  Created by Sierra 4 on 12/05/17.
//  Copyright © 2017 Code-brew. All rights reserved.
//

import Foundation
import UIKit

//Mark:AlertBox Function
func alertBox(_ Message:String,obj: UIViewController)
{
    let alertmsg = UIAlertController(title: printData.Alert.rawValue, message: Message, preferredStyle: UIAlertControllerStyle.alert)
    alertmsg.addAction(UIAlertAction(title: printData.ok.rawValue, style: UIAlertActionStyle.default, handler: nil))
    obj.present(alertmsg ,animated: true, completion: nil)
}
