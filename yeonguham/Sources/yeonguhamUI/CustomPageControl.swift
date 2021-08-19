//
//  CustomPageControl.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//
// Reference: https://stackoverflow.com/questions/60736212/how-to-change-page-control-dot-size-and-spacing-in-swift

import UIKit

class CustomPageControl: UIPageControl {
    
    override var currentPage: Int {
        didSet {
            self.pageIndicatorTintColor = .gray3
            self.currentPageIndicatorTintColor = .secondaryLightest
        }
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
 
    

}
