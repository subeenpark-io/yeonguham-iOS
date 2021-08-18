//
//  EmailEntryViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/18.
//

import UIKit
import RxSwift

class EmailEntryViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let helpText: UILabel = UILabel().then {
        $0.text = "이메일을 입력해주세요."
        $0.numberOfLines = 1
        $0.font = .typo2
        $0.textColor = .gray7
    }
    
    let textfield: UnderlinedTextField = UnderlinedTextField(placeholder: "yeonguham@wafflestudio.com")
    
    let button: LongHorizontalButton = LongHorizontalButton(buttonText: "계속하기", isActivated: false)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // navigation bar options
        self.setNavigationBar(titleText: "이메일 인증", isBackButtonHidden: false)
        
        // add gesture actions
        self.hideKeyboardWhenTappedAround()
        
        // add view, set layout
        self.view.addSubviews(helpText, textfield, button)
        setLayout()
        
        // add button enable condition/action
        addButtonEnable()
        addButtonAction()

    }
    
    func setLayout() {
        
        let outline = self.view.safeAreaLayoutGuide.snp

        helpText.snp.makeConstraints {
            $0.top.equalTo(outline.top).offset(32)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(234)
            $0.height.equalTo(72)
            
        }
        
        textfield.snp.makeConstraints {
            $0.top.equalTo(helpText.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
        }
        
        button.setButtonMarginAndHeight()
        button.snp.makeConstraints {
            $0.bottom.equalTo(outline.bottom).inset(24)
        }
        
        
    }
    
    func addButtonEnable() {
        
        let textFieldValidation = self.textfield.textField
            .rx.text
            .map({
                !($0?.isEmpty ?? true)
            })
            .bind(to: button.rx.isEnabled)
            .disposed(by: disposeBag)
        
    }
    
    func addButtonAction() {
        
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func buttonTapped(_ sender: Any) {
        
        
        guard let email = textfield.textField.text else { return }
        if email.isValidEmail() {
            self.navigationController?.pushViewController(EmailValidationViewController(), animated: true)
        }
        else {
            print("enable error")
            self.textfield.enableError(message: "올바른 이메일 주소를 입력해주세요.")
        }
        
    }

}
