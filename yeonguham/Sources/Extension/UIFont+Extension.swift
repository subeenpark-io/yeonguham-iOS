//
//  UIFont+Extension.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/11.
//

import UIKit


extension UIFont {
    
    
    class var subTypo1: UIFont { gmarketSansFont(type: .bold, size: 52)}
    class var subTypo3: UIFont { gmarketSansFont(type: .medium, size: 24)}
    
    class var typo2: UIFont { notoSansKRFont(type: .medium, size: 24) }
    
    class var typo4: UIFont { notoSansKRFont(type: .regular, size: 18) }
    class var typo4Medium: UIFont { notoSansKRFont(type: .medium, size: 18) }
        
    class var typo5: UIFont { notoSansKRFont(type: .regular, size: 16) }
    class var typo6: UIFont { notoSansKRFont(type: .regular, size: 14) }
    class var typo7: UIFont { notoSansKRFont(type: .regular, size: 12) }
    
    class func notoSansKRFont(type: NotoSansKRType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.name, size: size) else { return .systemFont(ofSize: 3) }
        return font
    }
    
    class func gmarketSansFont(type: GmarketSansType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.name, size: size) else { return .systemFont(ofSize: 3) }
        return font
    }

    public enum NotoSansKRType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"

        var name: String {
            "NotoSansKR-" + self.rawValue
        }
    }
    
    public enum GmarketSansType: String {
        case bold = "Bold"
        case medium = "Medium"
        case light = "Light"

        var name: String {
            "GmarketSansTTF-" + self.rawValue
        }
    }
}
