//
//  SelectTagViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/18.
//
// Reference: https://github.com/kbw2204/TagList/blob/master/tagList/tagList/ViewController.swift

import UIKit

import Then
import SnapKit
import ReusableKit
import RxSwift
import RxCocoa

class SelectTagViewController: UIViewController {
  
  // MARK: - Constants
    
    let disposeBag = DisposeBag()
    
    enum Reusable {
        static let tagCell = ReusableCell<TagCell>()
      }
        
    
    let tagList: [String] = Const.tagList
    
    let selectedTagList: [String] = []
    
    let helpText: UILabel = UILabel().then {
        $0.text = "관심 분야를\n세 가지 이상 선택해주세요."
        $0.numberOfLines = 2
        $0.font = .typo3Medium
        $0.textColor = .gray7
        
    }
  
  // MARK: - View
  
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
    
    let layout = LeftAlignedCollectionViewFlowLayout()
    layout.minimumLineSpacing = 16
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    $0.isScrollEnabled = true
    $0.collectionViewLayout = layout
    $0.register(Reusable.tagCell)
  }
    
  let button: LongHorizontalButton = LongHorizontalButton(buttonText: "계속하기", isActivated: false)

  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    // navigation bar options
    self.setNavigationBar(titleText: "관심 분야", isBackButtonHidden: false)
    
    // add collection view
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    self.collectionView.backgroundColor = .white
    self.collectionView.allowsMultipleSelection = true
    
    // add views
    self.view.addSubviews(helpText, collectionView, button)
    
    // set layout
    setLayouts()
    
    // add button tap action
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
    
  }
    

  
  func setLayouts() {
    
    helpText.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(32)
        $0.leading.equalToSuperview().offset(24)
        $0.height.equalTo(66)
    }
    
    button.setButtonMarginAndHeight()
    button.snp.makeConstraints {
        $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(24)
    }
    
    collectionView.snp.makeConstraints {
        $0.top.equalTo(helpText.snp.bottom).offset(24)
        $0.leading.equalToSuperview().offset(24)
        $0.trailing.equalToSuperview().inset(24)
        $0.bottom.equalTo(button.snp.top).inset(24)
    }
    
    
    
  }
    

    @objc func buttonTapped() {
        let items = collectionView.indexPathsForSelectedItems
        print(items)
        navigationController?.pushViewController(CustomTabBar(), animated: true)
        
    }


    
    
} // END OF VIEW CONTROLLER


extension SelectTagViewController: UICollectionViewDataSource {
  // cell갯수
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tagList.count
  }
  
  // cell 선언
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(Reusable.tagCell, for: indexPath)
    
    cell.tagLabel.text = tagList[indexPath.item]
    
    return cell
  }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.indexPathsForSelectedItems?.count ?? 0 >= 3 {
            button.isEnabled = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView.indexPathsForSelectedItems?.count ?? 0 < 3 {
            button.isEnabled = false
        }
    }

}

extension SelectTagViewController: UICollectionViewDelegateFlowLayout {
  // 셀 크기설정
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let label = UILabel().then {
        $0.font = .typo4Medium
        $0.text = tagList[indexPath.item]
        $0.sizeToFit()
    }
    let size = label.frame.size
    
    return CGSize(width: size.width + 32, height: size.height + 20)
  }
}
