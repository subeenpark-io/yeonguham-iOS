//
//  UITableViewCell+Extension.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit


// Reference: https://developer.apple.com/forums/thread/675236
// Issue: Collectionview does not scroll inside the table view cell
extension UITableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
