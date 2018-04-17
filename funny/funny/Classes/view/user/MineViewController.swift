//
//  MineViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/18.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    @IBOutlet weak var dd: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        okBtn.setTitle("SINOTHK", for:UIControlState.normal)
        okBtn.backgroundColor = UIColor.orange
        
        okBtn.addTarget(self, action: #selector(startUse), for: .touchUpInside)
    }
    
    @objc private func startUse(){
        print("www.sinothk.com")
    }
}
