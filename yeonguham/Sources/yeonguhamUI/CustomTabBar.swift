//
//  CustomTabBar.swift
//  yeonguham
//
//  Created by Subeen Park on 2021/08/19.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setTabBarDesign()
        setTabBar()
        self.hideNavigationBar()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.isHidden = true
        
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.hideNavigationBar()
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setTabBarDesign() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .primary
        UITabBar.appearance().layer.borderWidth = 1
        UITabBar.appearance().layer.borderColor = UIColor.gray1.cgColor
    }
    
    func setTabBar() {
        
        let home = HomeViewController()
        let recommendation = RecommendationViewController()
        let notification = NotificationViewController()
        let myProfile = MyProfileViewController()
        
        home.tabBarItem.image = UIImage(named: "iconHomeDefault")
        home.tabBarItem.selectedImage = UIImage(named: "iconHomeActive")
        home.tabBarItem.title = "홈"
        
        recommendation.tabBarItem.image = UIImage(named: "iconRecommendationDefault")
        recommendation.tabBarItem.selectedImage = UIImage(named: "iconRecommendationActive")
        recommendation.tabBarItem.title = "추천"
        
            
        notification.tabBarItem.image = UIImage(named: "iconNotificationDefault")
        notification.tabBarItem.selectedImage = UIImage(named: "iconNotificationActive")
        notification.tabBarItem.title = "알림"
            
        myProfile.tabBarItem.image = UIImage(named: "iconUserDefault")
        myProfile.tabBarItem.selectedImage = UIImage(named: "iconUserActive")
        myProfile.tabBarItem.title = "내 프로필"
        
        self.setViewControllers([home, recommendation, notification, myProfile], animated: true)
        self.selectedIndex = 0
        
    }

}
