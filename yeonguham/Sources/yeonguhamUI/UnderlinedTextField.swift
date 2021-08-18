//
//  UnderlinedTextField.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/11.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

class UnderlinedTextField: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let textField: UITextField = UITextField().then {
        $0.textColor = .gray6
        $0.font = .typo6
        $0.placeholder = "default placeholder"
    }
    
    let textFieldWrapper: UIView = UIView()
    
    let underline: UIView = UIView().then {
        $0.backgroundColor = .gray3
        
    }
    
    let errorMessage: UILabel = UILabel().then {
        $0.textColor = .complementary
        $0.font = .typo7
        $0.text = "errorMessage"
        $0.isHidden = true
    }
    
    let cancelButton: UIButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "Cancel"), for: .normal)
        $0.isHidden = true
    }
    
    let disposeBag = DisposeBag()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        initTextField()
        addButtonAction()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        
        textFieldWrapper.addSubviews(textField, underline, cancelButton)
        self.addSubviews(textFieldWrapper, errorMessage)
        
        self.textFieldWrapper.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalToSuperview().offset(32)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.bottomMargin.equalTo(32)
        }
        
        self.textField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        self.underline.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        self.errorMessage.snp.makeConstraints {
            $0.leading.equalTo(underline.snp.leading)
            $0.top.equalTo(underline.snp.bottom).offset(2)
            $0.height.equalTo(18)
        }
        
        self.cancelButton.snp.makeConstraints {
            $0.trailing.equalTo(textFieldWrapper.snp.trailing).inset(8)
            $0.bottom.equalTo(textFieldWrapper.snp.bottom).inset(11)
            $0.width.height.equalTo(24)
        }
        
    }
    
    func initTextField() {
        let whileEditing = self.textField.rx.controlEvent([.editingChanged])
            .asObservable()
            .subscribe(onNext: { [unowned self] _ in
                self.underline.backgroundColor = .primary
                self.disableError()
            }).disposed(by: disposeBag)
        
        
        let endEditing = self.textField.rx.controlEvent([.editingDidEnd])
            .asObservable()
            .subscribe(onNext: { [unowned self] _ in
                self.underline.backgroundColor = self.textField.text?.isEmpty ?? true ? UIColor.gray3 : UIColor.gray5
                cancelButton.isHidden = true
            })


    }
    
    func addButtonAction() {
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc func cancelButtonTapped() {
        print("cancelButtonTapped")
        textField.text = ""
    }
    
    func disableError() {
        errorMessage.isHidden = true
    }
    
    func enableError(message: String) {
        errorMessage.text = message
        cancelButton.isHidden = false
        underline.backgroundColor = .complementary
    }

}
