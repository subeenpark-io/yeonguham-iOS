//
//  HorizontalScrollCollectionView.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit

class HorizontalScrollCollectionView: UITableViewCell {
    
    var data: [Any] = []
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 16
        
        $0.backgroundColor = .white
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 24, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        bindConstraints()
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .white
        self.contentView.addSubview(collectionView)
        self.contentView.clipsToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SquareResearchCollectionViewCell.self, forCellWithReuseIdentifier: SquareResearchCollectionViewCell.registerId)
    }
    
    func bindConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.centerY.equalToSuperview()
//            make.height.equalTo(340)
        }
    }
    
    func loadData(data: [Any]) {
        self.data = data
        self.collectionView.reloadData()
    }
    

}

extension HorizontalScrollCollectionView: UICollectionViewDelegate {
    
    
}

extension HorizontalScrollCollectionView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SquareResearchCollectionViewCell.registerId, for: indexPath) as? SquareResearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let dataPoint = data[indexPath.row] as? DummyResearch {
            cell.setData(data: dataPoint)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 144, height: 161)
    }

    
    
    
    
}



