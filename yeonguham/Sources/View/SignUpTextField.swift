//
//  SignUpTextField.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/07/07.
//

import UIKit
import SnapKit
import Then

@IBDesignable
class SignUpTextField: UIView {


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let wrapperView = UIView()

    let textField = UITextField().then {
        $0.clearButtonMode = .whileEditing
        $0.isSecureTextEntry = false
        $0.font = UIFont(name: "NotoSansKR-Regular", size: 18)
        $0.textColor = UIColor(named: "Gray-6")
    }
    
    let underline = UIView().then {
        $0.backgroundColor = UIColor(named: "Gray-5")
    }
    
    let warningMessage = UILabel().then {
        $0.font = .systemFont(ofSize: 10)
        $0.textColor = UIColor(named: "Complementary")
        $0.text = "warningMessage"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeView()
    }
    
    private func initializeView() {
        warningMessage.isHidden = true
        [textField, underline, warningMessage].forEach {
            wrapperView.addSubview($0)
        }
        self.addSubview(wrapperView)
        self.setLayout()
        self.textField.backgroundColor = .black
    }
    
    public func setWarningMessage(_ warningMessage: String="") {
        self.warningMessage.text = warningMessage
    }
    
    public func showWarningMessage() {
        self.warningMessage.isHidden = false
    }
    
    public func hideWarningMessage() {
        self.warningMessage.isHidden = true
    }
    
//    public func changeThemeColor(color: UIColor) {
//        self.titleLabel.textColor = color
//        self.underline.backgroundColor = color
//    }
    
    public func turnOnSecurityMode() {
        self.textField.isSecureTextEntry = true
    }
    
    func setLayout() {
        
        self.wrapperView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.top.equalToSuperview()
        }

        self.textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.height.equalTo(27)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        self.underline.snp.makeConstraints {
            $0.top.equalTo(self.textField.snp.bottom)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
        
        self.warningMessage.snp.makeConstraints {
            $0.top.equalTo(underline.snp.bottom).offset(2)
            $0.height.equalTo(18)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
    

}
