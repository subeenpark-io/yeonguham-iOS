//
//  TestViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/11.
//

import UIKit
import Then
import SnapKit

class TestViewController: UIViewController {
    
    let researchCreate: UIButton = UIButton().then {
        $0.setTitle("ToResearchCreate", for: .normal)
        $0.backgroundColor = .black
    }
    
    let textField: UnderlinedTextField = UnderlinedTextField(placeholder: "hihi")
    
    let button: LongHorizontalButton = LongHorizontalButton(buttonText: "계속하기", isActivated: false)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        self.view.backgroundColor = .white
        
        

        // Do any additional setup after loading the view.
        self.view.addSubviews(researchCreate, textField, button)
        
        researchCreate.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        textField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(300)

        }
        
        button.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(100)
        }
        button.setButtonMarginAndHeight()
        
        researchCreate.addTarget(self, action: #selector(self.tapToResearchCreate), for: .touchUpInside)
        
        

    }
    
    @objc
    func tapToResearchCreate() {
        print("research create tapped")
        self.navigationController?.pushViewController(ResearchCreateViewController(), animated: true)
        
    }
    
    @objc
    override func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    static func printTapped() {
        print("Tapped")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
