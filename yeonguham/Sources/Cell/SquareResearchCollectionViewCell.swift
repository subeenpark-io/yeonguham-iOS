//
//  SquareResearchCollectionViewCell.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import Then
import SnapKit
import UIKit

class SquareResearchCollectionViewCell: UICollectionViewCell {
    
    static let registerId = "\(SquareResearchCollectionViewCell.self)"
    
    let main = UIView().then {
        $0.makeRoundedWithBorder(radius: 8, color: UIColor.gray2.cgColor)
    }
    
    let fieldChip = YeonguhamChip(type: .field)
    let statusChip = YeonguhamChip(type: .participationStatus).then {
        $0.isHidden = true
    }
    let titleLabel = UILabel().then {
        $0.font = .typo6
        $0.textColor = .gray7
        $0.numberOfLines = 4
    }
    
    let bottomStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.translatesAutoresizingMaskIntoConstraints = false;
        $0.alignment = .leading
        
    }
    
    let userIcon = UIImageView().then {
        $0.image = UIImage(named: "iconUserDefault")?.withTintColor(.primaryDarkest)
        $0.contentMode = .scaleAspectFit
    }
    
    let countLabel = UILabel().then {
        $0.font = .typo7
        $0.textColor = .gray5
    }
    
    let dDayLabel = UILabel().then {
        $0.font = .typo7
        $0.textColor = .gray5
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setLayout()
    }
    

    private func setLayout() {
        addSubview(main)
        main.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        // chip
        main.addSubviews(fieldChip, statusChip)
        fieldChip.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(10)
        }
        statusChip.snp.makeConstraints {
            $0.top.equalTo(fieldChip.snp.top)
            $0.leading.equalTo(fieldChip.snp.trailing).offset(8)
        }
        
        // title
        main.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(fieldChip.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        // stackView
        [userIcon, countLabel, dDayLabel].forEach {
            bottomStackView.addArrangedSubview($0)
        }
        userIcon.snp.makeConstraints {
            $0.width.height.equalTo(16)
        }
        
        main.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
    
    func setData(data: DummyResearch) {
        fieldChip.setLabel(labelText: data.field)
        if data.isParticipating {
            statusChip.setLabel(labelText: "참여중")
            statusChip.isHidden = false
            dDayLabel.text = "\(data.dDay)일 후 시작"
            dDayLabel.textColor = .secondaryLightest
        }
        else {
            statusChip.isHidden = true
            dDayLabel.text = "\(data.dDay)일 남음"
        }
        titleLabel.text = data.title
        countLabel.text = "\(data.numParticipant)/\(data.quota)"
    }
    
}
