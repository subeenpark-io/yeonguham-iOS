//
//  TagCell.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/18.
//
// Reference: https://github.com/kbw2204/TagList/blob/master/tagList/tagList/TagCell.swift

import UIKit
import Then
import RxSwift

class TagCell: UICollectionViewCell {
  
  // MARK: - View
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                contentView.makeRoundedWithBorder(radius: 25, color: UIColor.primary.cgColor)
                tagLabel.textColor = .primary
            }
            else {
                contentView.makeRoundedWithBorder(radius: 25, color: UIColor.gray3.cgColor)
                tagLabel.textColor = .gray7
            }
        }
    }
    

  
  let tagLabel = UILabel().then {
    $0.font = .typo4Medium
    $0.textColor = .gray7
  }
  
  // MARK: - layout
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(tagLabel)
    contentView.makeRoundedWithBorder(radius: 25, color: UIColor.gray3.cgColor)
    
    setConstraint()
  }
  
    func setConstraint() {
        tagLabel.snp.makeConstraints {
          $0.center.equalToSuperview()
        }
    }

  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
