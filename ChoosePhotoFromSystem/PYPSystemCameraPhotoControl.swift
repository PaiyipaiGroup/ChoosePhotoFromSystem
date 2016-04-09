//
//  PYPSystemPhotoViewController.swift
//  ChoosePhotoFromSystem
//
//  Created by Erickson on 16/4/9.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit

protocol PYPSystemCameraPhotoControlDelegate :class {
    func didFinishPickingMediaWithInfo(info:[String : AnyObject])
}

class PYPSystemCameraPhotoControl: NSObject {

    weak var delegate: PYPSystemCameraPhotoControlDelegate?
    
    func editAvatar(viewController:protocol<PYPSystemCameraPhotoControlDelegate>) {

        delegate = viewController
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let  cameraAction = UIAlertAction(title: "拍照", style: .Default) {[unowned self] (action) in
            self.openPicker(.Camera)
        }
        alertController.addAction(cameraAction)
        let  albumAction = UIAlertAction(title: "从相册中选择", style: .Default) {[unowned self] (action) in
            self.openPicker(.PhotoLibrary)
        }
        alertController.addAction(albumAction)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(alertController, animated: true, completion: nil)
    }
    func openPicker(type: UIImagePickerControllerSourceType) {
        
        let rootVc =  UIApplication.sharedApplication().keyWindow?.rootViewController

        if UIImagePickerController.isSourceTypeAvailable(type) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = type
            imagePicker.allowsEditing = true
            rootVc!.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    

}
extension PYPSystemCameraPhotoControl : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        delegate?.didFinishPickingMediaWithInfo(info)
        UIApplication.sharedApplication().keyWindow?.rootViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        UIApplication.sharedApplication().keyWindow?.rootViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

