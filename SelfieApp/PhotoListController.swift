//
//  ViewController.swift
//  SelfieApp
//
//  Created by Aleksander Makedonski on 2/7/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit

class PhotoListController: UIViewController {

    lazy var cameraButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        
        button.setTitle("Camera", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor(red: 254/255.0, green: 123/255.0, blue: 135/255.0, alpha: 1.0)
        
        button.addTarget(self, action: #selector(PhotoListController.presentImagePickerController), for: .touchUpInside)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func presentImagePickerController() {
        
    }
}
