//
//  YeonguhamChip.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit
import Then
import SnapKit

class YeonguhamChip: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    enum ChipType {
        case field
        case participationStatus
    }
    
    let label: UILabel = UILabel().then {
        $0.font = .typo8Medium
        $0.text = "기본텍스트"
    }
    
    init(type: ChipType) {
        super.init(frame: CGRect.zero)
        
        switch type {
        case .field:
            label.textColor = .primary
            self.makeRoundedWithBorder(radius: 2, color: UIColor.primary.cgColor)
        case .participationStatus:
            label.textColor = .secondary
            self.makeRoundedWithBorder(radius: 2, color: UIColor.secondary.cgColor)
        }
        
        self.addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
        }
        
    }
    
    
    func setLabel(labelText: String) {
        label.text = labelText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
