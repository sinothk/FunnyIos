//
//  TestViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/18.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var goLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goLogin.setTitle("现在登录", for: UIControlState.normal)
        goLogin.addTarget(self, action: #selector(startUse), for: .touchUpInside)
    }
    
    @objc private func startUse(){
        print("www.sinothk.com")
    }
}
