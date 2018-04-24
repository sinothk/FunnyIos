//
//  MainViewController.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/9.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Thread.sleep(forTimeInterval: 1)//延长3秒
        
        addChildViewControllers()
    }
}

extension MainViewController{
    private func addChildViewControllers() {
        tabBar.tintColor = UIColor.orange
        
        addChildViewController(vc:HomeTableViewController(), title:"异趣", image: "ic_nav_nearby_normal")
        addChildViewController(vc:DiscoverViewController(), title:"足迹", image:"ic_nav_follow_normal")
        addChildViewController(vc:MineViewController(), title:"我的", image:"ic_nav_profile_normal")
    }
    
    ///
    private func addChildViewController(vc: UIViewController, title:String, image:String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named: image)
        
        let nav = UINavigationController(rootViewController: vc)
        
        addChildViewController(nav)
    }
}
