//
//  MainViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/05/26.
//

import UIKit
import Firebase
import GoogleSignIn

// for apple login
import FirebaseAuth
import AuthenticationServices
import CryptoKit

// for kakao login
import KakaoSDKUser

class MainViewController: UIViewController, ASAuthorizationControllerDelegate {
    
    fileprivate var currentNonce: String?

    @IBOutlet weak var googleButton: GIDSignInButton!
    
    @IBOutlet weak var kakaoButton: UIView!

    
    @IBOutlet weak var appleButton: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        makeButtonsRounded()
        giveShadows()
        
        googleButton.isUserInteractionEnabled = true
        let tapGoogle = UITapGestureRecognizer(target: self, action: #selector(googleButtonPressed(_:)))
        googleButton.addGestureRecognizer(tapGoogle)
        
        kakaoButton.isUserInteractionEnabled = true
        let tapKakao = UITapGestureRecognizer(target: self, action: #selector(kakaoButtonPressed(_:)))
        kakaoButton.addGestureRecognizer(tapKakao)
        
        appleButton.isUserInteractionEnabled = true
        let tapApple = UITapGestureRecognizer(target: self, action: #selector(appleButtonPressed(_:)))
        appleButton.addGestureRecognizer(tapApple)
        
        
        
    }
    
    

    private func makeButtonsRounded() {
        [googleButton, kakaoButton, appleButton].forEach {
            $0?.makeRounded(radius: 4)
        }
    }
    
    private func giveShadows() {
        [googleButton, kakaoButton, appleButton].forEach {
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
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
//
//        self.navigationController?.pushViewController(Const.Storyboard.nickname.viewController, animated: true)
//
        
    }
    
    @objc func kakaoButtonPressed(_ sender: Any) {
        print("KakoButtonTapped")
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }

        
    }

    @objc func appleButtonPressed(_ sender: Any) {
        
        print("AppleButtonTapped")
        FirebaseAuthentication.shared.signInWithApple(window: UIWindow())
    }
}
