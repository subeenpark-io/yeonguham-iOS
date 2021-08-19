//
//  HomeViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let toolbar: MainToolBar = MainToolBar()
    let categoryTitleLabel: UILabel = UILabel().then {
        $0.text = "분야별 연구"
        $0.font = .typo4Medium
        $0.textColor = .gray7
    }
    let categoryPagingView = UIScrollView().then {
        $0.backgroundColor = .gray1
        $0.isPagingEnabled = true
    }
    
    let pageControl: CustomPageControl = CustomPageControl().then {
        $0.numberOfPages = 2
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .gray3
        $0.currentPageIndicatorTintColor = .secondaryLightest
    }
    
    let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 11
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 20*2, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView

    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.register(FieldCollectionViewCell.self, forCellWithReuseIdentifier: "fieldCollectionViewCell")
        categoryCollectionView.delegate = self
        
        setLayouts()
        
    }
    
    
    
    func setLayouts() {
        
        categoryPagingView.addSubviews(pageControl, categoryCollectionView)
        self.view.addSubviews(toolbar, categoryTitleLabel, categoryPagingView)
        
        toolbar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        categoryTitleLabel.snp.makeConstraints {
            $0.top.equalTo(toolbar.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(27)
        }
        
        categoryPagingView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(categoryTitleLabel.snp.bottom).offset(8)
            $0.height.equalTo(150)
        }
        
        categoryCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(19)
        }
        
        pageControl.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(26)
            $0.height.equalTo(6)
        }
        
        
        
 
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "fieldCollectionViewCell", for: indexPath) as! FieldCollectionViewCell
        cell.setData(title: Const.tagList[indexPath.row], imageStr: Const.imageList[indexPath.row])
        
        return cell
    }

    

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 11
        }

        // 옆 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 12
        }

        // cell 사이즈( 옆 라인을 고려하여 설정 )
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let width = collectionView.frame.width / 6 - 12 ///  3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
            print("collectionView width=\(collectionView.frame.width)")
            print("cell하나당 width=\(width)")
            print("root view width = \(self.view.frame.width)")

            let size = CGSize(width: width, height: 56)
            return size
        }
    
}
