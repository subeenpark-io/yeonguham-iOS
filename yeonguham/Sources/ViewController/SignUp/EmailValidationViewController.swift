//
//  EmailValidationViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/07/07.
//

import UIKit

class EmailValidationViewController: UIViewController {

    
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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


    @IBAction func barButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
