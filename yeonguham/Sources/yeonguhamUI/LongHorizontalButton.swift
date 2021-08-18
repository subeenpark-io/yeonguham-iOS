//
//  LongHorizontalButton.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/18.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class LongHorizontalButton: UIButton {
    
    
    
    init(buttonText: String, isActivated: Bool) {
        super.init(frame: CGRect.zero)
        
        setButtonDesgin(buttonText: buttonText)
        setLayout()
        self.isEnabled = isActivated
    
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setButtonDesgin(buttonText: String) {
        self.setTitle(buttonText, for: .normal)
        self.setBackgroundColor(.primary, for: .normal)
        self.setBackgroundColor(.primaryDarker, for: .highlighted)
        self.setBackgroundColor(.gray3, for: .disabled)
        self.titleLabel?.font = .typo4
    }
    
    
    func setLayout() {
        self.makeRounded(radius: 4)
    }

    
}
