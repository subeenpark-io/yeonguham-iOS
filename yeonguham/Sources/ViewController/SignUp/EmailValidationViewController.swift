//
//  EmailValidationViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/07/07.
//

import UIKit
import RxSwift

class EmailValidationViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let helpText: UILabel = UILabel().then {
        $0.text = "이메일을 확인해주세요."
        $0.numberOfLines = 1
        $0.font = .typo2
        $0.textColor = .gray7
    }
    
    let subHelpText: UILabel = UILabel().then {
        $0.text = "메일로 전송된 링크를 클릭해\n인증을 완료해주세요."
        $0.numberOfLines = 2
        $0.font = .typo4
        $0.textColor = .gray7
    }
    
    let resendText: UILabel = UILabel().then {
        let text = "메일을 받지 못하셨나요? 재전송"
        $0.text = "메일을 받지 못하셨나요? 재전송"
        $0.font = .typo4
        $0.textColor = .gray5
        let attributedStr = NSMutableAttributedString(string: $0.text ?? text)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.primary, range: (text as NSString).range(of:"재전송"))
        $0.attributedText = attributedStr

    }
    
    let button: LongHorizontalButton = LongHorizontalButton(buttonText: "인증완료", isActivated: true)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // navigation bar options
        self.setNavigationBar(titleText: "이메일 인증", isBackButtonHidden: false)
        
        // add gesture actions
        self.hideKeyboardWhenTappedAround()
        
        // add view, set layout
        self.view.addSubviews(helpText, subHelpText, resendText, button)
        setLayout()
        
        // add button enable condition/action
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
        
        subHelpText.snp.makeConstraints {
            $0.top.equalTo(helpText.snp.bottom).offset(27)
            $0.leading.equalToSuperview().offset(24)
        }
        
        
        button.setButtonMarginAndHeight()
        button.snp.makeConstraints {
            $0.bottom.equalTo(outline.bottom).inset(24)
        }
        
        resendText.snp.makeConstraints {
            $0.bottom.equalTo(outline.bottom).inset(104)
            $0.leading.equalToSuperview().offset(24)
            $0.height.equalTo(27)
        }
        
        
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
        
        self.navigationController?.pushViewController(SelectTagViewController(), animated: true)
        
    }

}
