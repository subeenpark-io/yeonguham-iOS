//
//  Storyboard.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/05/26.
//

import UIKit


extension Const {
    
    enum Storyboard: String {
        
        case main = "Main"
        case nickname = "Nickname"
        
        case noticeMain = "NoticeMain"
        case followMain = "FollowMain"
        case savedMain = "SavedMain"

        
        
        var storyboard: UIStoryboard {
            UIStoryboard(name: self.rawValue, bundle: nil)
            
        }
        
        var viewController: UIViewController {
            let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: "\(self.rawValue)ViewController")
        }
        
    }
}

