//
//  MediaPickerManager.swift
//  SelfieApp
//
//  Created by Aleksander Makedonski on 2/7/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit
import MobileCoreServices

class MediaPickerManager: NSObject {

        private let imagePickerController = UIImagePickerController()
        private let presentingViewController: UIViewController
    
    init(presentingViewController: UIViewController){
        self.presentingViewController = presentingViewController
        
        super.init()
        
 //       imagePickerController.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePickerController.sourceType = .camera
            imagePickerController.cameraDevice = .front
        } else {
            imagePickerController.sourceType = .photoLibrary
        }
        
        imagePickerController.mediaTypes = [kUTTypeImage as String]
    }
    
    func presentImagePickerController(animated animated: Bool){
        presentingViewController.present(imagePickerController, animated: animated, completion: nil)
    }
    
    func dismissImagePickerController(animated animated: Bool, completion: @escaping (() -> Void)){
        imagePickerController.dismiss(animated: animated, completion: completion)
    }
}
