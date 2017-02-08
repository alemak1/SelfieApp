//
//  FilteredImageBuilder.swift
//  SelfieApp
//
//  Created by Aleksander Makedonski on 2/8/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import CoreImage

struct PhotoFilter{
    
    static let ColorClamp = "CIColorClamp"
    static let ColorControls = "CIColorControls"
    static let PhotoEffectInstant = "CIPhotoEffectInstant"
    static let PhotoEffectProcess = "CIPhotoEffectProcess"
    static let PhotoEffectNoir = "CIPhotoEffectNoir"
    static let Sepia = "CISepiaTone"
    
    static func defaultFilter() -> [CIFilter]{
        
        //Color Clamp
        let colorClamp = CIFilter(name: PhotoFilter.ColorClamp)!
        colorClamp.setValue(CIVector(x: 0.2, y: 0.2, z: 0.2, w: 0.2), forKey: "inputMinComponents")
        colorClamp.setValue(CIVector(x: 0.9, y: 0.9, z: 0.9, w: 0.9), forKey: "inputMaxComponents")
        
        //Color Controls
        let colorControls = CIFilter(name: PhotoFilter.ColorControls)!
        colorControls.setValue(0.1, forKey: kCIInputSaturationKey)
        
        //Photo Effects
        let photoEffectInstant = CIFilter(name: PhotoFilter.PhotoEffectInstant)!
        let photoEffectProcess = CIFilter(name: PhotoFilter.PhotoEffectProcess)!
        let photoEffectNoir = CIFilter(name: PhotoFilter.PhotoEffectNoir)!
        
        //Sepia Tone
        let sepia = CIFilter(name: PhotoFilter.Sepia)!
        sepia.setValue(0.7, forKey: kCIInputIntensityKey)
        
        return [colorClamp, colorControls, photoEffectInstant, photoEffectProcess, photoEffectNoir,sepia]
    }
}
