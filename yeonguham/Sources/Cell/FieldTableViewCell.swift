//
//  FieldTableViewCell.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit
import Then

class FieldCollectionViewCell: UICollectionViewCell {
    
    let image: UIImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    let label: UILabel = UILabel().then {
        $0.font = .typo7
        $0.textColor = .gray5
    }

    
    init() {
        super.init(frame: CGRect.zero)
        contentView.addSubviews(image, label)
        
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(32)
            $0.top.equalToSuperview().offset(3)
        }
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(image.snp.bottom)
            $0.height.equalTo(18)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setData(title: String, imageStr: String) {
        label.text = title
        image.image = UIImage(named: imageStr)
    }

}
