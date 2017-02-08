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
    
    static func defaultFilter() -> [CIFilter]{
        let colorClamp = CIFilter(name: PhotoFilter.ColorClamp)!
        colorClamp.setValue(CIVector(x: 0.2, y: 0.2, z: 0.2, w: 0.2), forKey: "inputMinComponents")
        colorClamp.setValue(CIVector(x: 0.9, y: 0.9, z: 0.9, w: 0.9), forKey: "inputMaxComponents")
        return [colorClamp]
    }
}
