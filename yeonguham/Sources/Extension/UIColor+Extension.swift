//
//  UIColor+Extension.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/11.
//

import UIKit

extension UIColor {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    class var gray1: UIColor { fetchColor(#function) }
    class var gray3: UIColor { fetchColor(#function) }
    class var gray5: UIColor { fetchColor(#function) }
    class var gray6: UIColor { fetchColor(#function) }
    class var gray7: UIColor { fetchColor(#function) }
    class var primary: UIColor { fetchColor(#function) }
    class var primaryDarker: UIColor { fetchColor(#function)}
    class var complementary: UIColor { fetchColor(#function) }
    class var secondaryLightest: UIColor { fetchColor(#function) }
    
    
    private static func fetchColor(_ name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            return .black
        }
        return color
    }

}
