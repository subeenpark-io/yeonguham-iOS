//
//  NicknameViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/05/26.
//

import UIKit

class NicknameViewController: UIViewController {
    

    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var button: UIButton!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.initCustomNavbar()
        button.makeRounded(radius: 4)


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func buttonTapped(_ sender: Any) {
        self.navigationController?.pushViewController(Const.Storyboard.emailValidation.viewController, animated: true)
    }

}
