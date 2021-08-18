//
//  UIView+Extension.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/05/26.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    
    // BORDER RADIUS
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func makeRoundedWithBorder(radius: CGFloat, color: CGColor) {
        makeRounded(radius: radius)
        self.layer.borderWidth = 1
        self.layer.borderColor = color
    }
    
    // BUTTON SHADOW
    func giveShadow(color: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, offsetX: Int = 0, offsetY: Int = 2, radius: CGFloat = CGFloat(8)) {
        
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        
    }
    
    
    
    
    
    
   

    
    
    
}
