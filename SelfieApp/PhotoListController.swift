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
    
    lazy var mediaPickerManager: MediaPickerManager = {
        let manager = MediaPickerManager(presentingViewController: self)
        manager.delegate = self
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //MARK: - Layout
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(cameraButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cameraButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            cameraButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cameraButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            cameraButton.heightAnchor.constraint(equalToConstant: 56.0)
            ])
    }

    @objc private func presentImagePickerController() {
        mediaPickerManager.presentImagePickerController(animated: true)
    }
}

//MARK: - MediaPickerManagerDelegate
extension PhotoListController: MediaPickerManagerDelegate{
    func mediaPickerManager(manager: MediaPickerManager, didFinishPickingImage image: UIImage) {
        //
    }
}



