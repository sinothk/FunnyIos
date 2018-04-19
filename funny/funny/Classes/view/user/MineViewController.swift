//
//  MineViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/18.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var sexImageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar.image = UIImage(named:"NewVersion3")
        avatar.layer.cornerRadius = 30
        avatar.layer.masksToBounds = true

        nicknameLabel.text = "倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密倪大密"
        nicknameLabel.textColor = themeTextColor

        ageLabel.text = "18"
        ageLabel.textColor = themeColor

        sexImageView.image = UIImage(named:"ic_weibouser_female")

        editBtn.addTarget(self, action: #selector(startUse), for: .touchUpInside)
    }
    
    @objc private func startUse(){
        print("www.sinothk.com")
    }
}
