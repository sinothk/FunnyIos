//
//  MineViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/18.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit
import ImageLoader

class MineViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var sexImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar.show(url: "http://sinothk.com/images/about.png", defaultImg: UIImage(named: "ic_chat_def_pic")!)
        
        avatar.layer.cornerRadius = 30
        avatar.layer.masksToBounds = true

        nicknameLabel.text = "倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密"
        nicknameLabel.textColor = themeTextColor

        ageLabel.text = "18"
        ageLabel.textColor = themeColor

        sexImageView.image = UIImage(named:"ic_weibouser_female")

        editBtn.addTarget(self, action: #selector(startUse), for: .touchUpInside)

        logout.setTitleColor(UIColor.white, for: UIControlState.normal)
        logout.backgroundColor = themeColor
        logout.layer.cornerRadius = 6
        logout.addTarget(self, action: #selector(exit), for: .touchUpInside)
        
//
//        let object = UserEntity()
//        object.age = 22
//        object.name = "LiangYT"
//
//        let jsonString = object.toJSONString()!
//
//        if let object = UserEntity.deserialize(from: jsonString) {
//            print(object.name ?? "TT")
//            print(object.age)
//        }
    }
    
    @objc private func startUse(){
        print("www.sinothk.com")
    }
    
    @objc private func exit(){
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification),
            object: "LoginViewController")
    }
}
