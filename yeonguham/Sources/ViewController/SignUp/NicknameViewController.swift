//
//  NicknameViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/05/26.
//

import UIKit
import RxSwift

class NicknameViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let helpText: UILabel = UILabel().then {
        $0.text = "사용하실 닉네임을\n입력해주세요."
        $0.numberOfLines = 2
        $0.font = .typo2
        $0.textColor = .gray7
    }
    
    let textfield: UnderlinedTextField = UnderlinedTextField(placeholder: "닉네임")
    
    let button: LongHorizontalButton = LongHorizontalButton(buttonText: "계속하기", isActivated: false)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // navigation bar options
        self.setNavigationBar(titleText: "닉네임 입력", isBackButtonHidden: true)
        
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
            $0.width.equalTo(183)
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
        print("Nickname button Tapped")
        self.navigationController?.pushViewController(EmailEntryViewController(), animated: true)
    }

}
