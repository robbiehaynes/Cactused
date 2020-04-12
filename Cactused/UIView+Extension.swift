//
//  UIView+Extension.swift
//  Cactused
//
//  Created by Robert Haynes on 2020/04/12.
//  Copyright © 2020 Haynes Developments. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colourOne: UIColor, colourTwo: UIColor) {
        
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        gradientLayer.colors = [colourOne.cgColor,colourTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
