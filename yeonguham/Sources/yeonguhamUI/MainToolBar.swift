//
//  MainToolBar.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit
import Then
import SnapKit

class MainToolBar: UIToolbar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
//    let logoView = UIImageView().then {
//        $0.image = UIImage(named: "logotype")
//        $0.frame.size = CGSize(width: 79, height: 38)
//    }
    
    let logo = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "logotype")))
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    let searchButton = UIBarButtonItem(customView: UIImageView(image: UIImage(named: "iconSearch")))
    
    
    
    init() {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        self.setItems([logo, flexibleSpace, searchButton], animated: false)
        self.barTintColor = .white
        
        // for white boundary 
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
