//
//  UIView+Extensions.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import UIKit

extension UIView {
    
    var size: CGSize {
        get {
            return UIScreen.main.bounds.size
        }
    }
    
    func setGradientBackground(horizontal: Bool, colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
//        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = UIScreen.main.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
