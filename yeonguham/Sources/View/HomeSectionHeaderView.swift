//
//  HomeSectionHeaderView.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit
import Then
import SnapKit

class HomeSectionHeaderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let label: UILabel = UILabel().then {
        $0.font = .typo4Medium
        $0.textColor = .gray7
    }
    
    init(sectionTitle: String) {
        super.init(frame: CGRect.zero)
        self.addSubview(label)
        label.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().offset(16)
        }
        label.text = sectionTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented yet")
    }

}
