//
//  UIButton+Extension.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/18.
//

import UIKit

extension UIButton {
    
    // reference: https://jmkim0213.github.io/ios/swift/ui/2019/02/05/button_background.html
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
    
    func setButtonMarginAndHeight() {
        self.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(56)
        }
    }
    
}
