//
//  ViewController.swift
//  ChoosePhotoFromSystem
//
//  Created by Erickson on 16/4/9.
//  Copyright © 2016年 paiyipai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sys = PYPSystemCameraPhotoControl()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        sys.editAvatar(self)
        
    }
}

extension ViewController: PYPSystemCameraPhotoControlDelegate {
    func didFinishPickingMediaWithInfo(info: [String : AnyObject]) {
//        print(info)
    }
}

