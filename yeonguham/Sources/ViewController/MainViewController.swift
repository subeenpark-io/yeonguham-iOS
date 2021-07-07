//
//  MainViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/05/26.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var googleButton: UIView!
    
    @IBOutlet weak var kakaoButton: UIView!
    
    @IBOutlet weak var naverButton: UIView!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeButtonsRounded()
        giveShadows()
        
        googleButton.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(googleButtonPressed(_:)))
        googleButton.addGestureRecognizer(tap)
        
    }
    

    private func makeButtonsRounded() {
        [googleButton, kakaoButton, naverButton].forEach {
            $0?.makeRounded(radius: 4)
        }
    }
    
    private func giveShadows() {
        [googleButton, kakaoButton, naverButton].forEach {
            $0?.giveShadow()
        }
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func googleButtonPressed(_ sender: Any) {
        
        print("tapped")

        self.navigationController?.pushViewController(Const.Storyboard.nickname.viewController, animated: true)
       
        
    }

}
