//
//  UINavigationItem+Extension.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/07/07.
//

import UIKit


extension UINavigationBar {
    
    func initCustomNavbar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.backIndicatorImage = UIImage(named: "backIcon")
        self.backIndicatorTransitionMaskImage = UIImage(named: "backIcon")
    }
    
}
