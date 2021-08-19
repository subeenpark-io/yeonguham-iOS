//
//  NotificationViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit


class NotificationViewController: UIViewController {
    

    private lazy var mainView = HorizontalScrollCollectionView.init(frame: self.view.frame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(SquareResearchCollectionViewCell.self, forCellWithReuseIdentifier: SquareResearchCollectionViewCell.registerId)
    }
    

}

extension NotificationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SquareResearchCollectionViewCell.registerId, for: indexPath) as? SquareResearchCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 144, height: 161)
    }
    
}
