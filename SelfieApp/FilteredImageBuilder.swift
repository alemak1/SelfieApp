//
//  FilteredImageBuilder.swift
//  SelfieApp
//
//  Created by Aleksander Makedonski on 2/8/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import CoreImage
import UIKit



final class FilteredImageBuilder{
    private let image: UIImage
    private let context: CIContext
    
    private struct PhotoFilter{
        
        static let ColorClamp = "CIColorClamp"
        static let ColorControls = "CIColorControls"
        static let PhotoEffectInstant = "CIPhotoEffectInstant"
        static let PhotoEffectProcess = "CIPhotoEffectProcess"
        static let PhotoEffectNoir = "CIPhotoEffectNoir"
        static let Sepia = "CISepiaTone"
        
        static func defaultFilters() -> [CIFilter]{
            
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
    
    init(context: CIContext ,image: UIImage){
        self.image = image
        self.context = context
    }
    
    func imageWithDefaultFilters() -> [CGImage]{
        return image(withFilters: PhotoFilter.defaultFilters())
    }
    
    func image(withFilters filters: [CIFilter]) -> [CGImage]{
     
        return filters.map{
            image(image: self.image, withFilter: $0)}
    }
    
    func image(image: UIImage, withFilter filter: CIFilter) -> CGImage{
        let inputImage = image.ciImage ?? CIImage(image: image)!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        
        return context.createCGImage(filter.outputImage!, from: inputImage.extent)!
    }
}
