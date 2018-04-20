//
//  WelcomeViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/16.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

//    private lazy var iconView: UIImageView = {
//        let iv = UIImageView(image:UIImage(named:"avatar_test"))
//        iv.layer.cornerRadius = 45
//        iv.layer.masksToBounds = true
//        return iv
//    }()
    
    private lazy var backImageView: UIImageView = UIImageView(image: UIImage(named: "LaunchImage"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
        
//        view = UIView(named: UIColor.orange)
        // Do any additional setup after loading the view.
    }
}
