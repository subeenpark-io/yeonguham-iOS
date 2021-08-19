//
//  UIViewController+Extension.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/18.
//

import UIKit


// Navigation Bar Settings
extension UIViewController {
    
    func hideNavigationBar() {
//        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func hideBackButtonText() {
        navigationItem.backButtonTitle = ""
    }
    
    func setNavigationBar(titleText: String, isBackButtonHidden: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = titleText
        self.navigationItem.backButtonTitle = ""
        self.navigationItem.hidesBackButton = isBackButtonHidden
        
    }
    
}

// Dismiss keyboard on tap
// Reference: https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


