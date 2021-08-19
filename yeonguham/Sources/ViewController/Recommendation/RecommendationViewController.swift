//
//  RecommendationViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit
import Then
import SnapKit

class RecommendationViewController: UIViewController {
    
    
    let tableView: UITableView = UITableView().then {
        $0.backgroundColor = .yellow
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }

    }
    

    


}

extension RecommendationViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
//
}


extension RecommendationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 2:
            return 334
        default:
            return 10
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 2:
            return HorizontalScrollCollectionView()
        default:
            return UITableViewCell().then {
                $0.backgroundColor = .red
            }
            
        }
        
    }
    
    
}



