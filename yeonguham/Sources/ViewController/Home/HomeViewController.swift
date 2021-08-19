//
//  HomeViewController.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    let toolbar: MainToolBar = MainToolBar()
    
    let tableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped).then {
        $0.separatorStyle = .none
        $0.sectionFooterHeight = 20
        $0.backgroundColor = .clear
        $0.tableFooterView = nil
        $0.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 16))
    
    }
    
    let recentResearchHorizontalScrollView = HorizontalScrollCollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableData()
        setTableViewDelegates()
        setLayouts()
        
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        self.hideNavigationBar()
    }
    
    func setTableData() {
        recentResearchHorizontalScrollView.loadData(data: DummyResearch.dummyResearches)
        tableView.reloadData()
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    func setLayouts() {
        
        self.view.addSubview(toolbar)
        toolbar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(toolbar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(35)
        }

        
    }

}



extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1, 2:
            return 338
        default:
            return 10
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {

        case 2:
            return recentResearchHorizontalScrollView
        default:
            return UITableViewCell().then {
                $0.backgroundColor = .red
            }
            
        }
        
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return HomeSectionHeaderView(sectionTitle: "분야별 연구")
        case 1:
            return HomeSectionHeaderView(sectionTitle: "실시간 인기 연구")
        case 2:
            return HomeSectionHeaderView(sectionTitle: "최근 등록된 연구")
        default:
            return UILabel().then {
                $0.text = "section header not implemented yet"
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 2:
            return 35
        default:
            return 20
        }
    }
    
    

}
    







