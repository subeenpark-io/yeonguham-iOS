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
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func hideBackButtonText() {
        navigationItem.backButtonTitle = ""
    }
    
    func setNavigationBar(titleText: String, isBackButtonHidden: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationItem.hidesBackButton = isBackButtonHidden
        self.navigationController?.navigationBar.topItem?.title = titleText
        
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


