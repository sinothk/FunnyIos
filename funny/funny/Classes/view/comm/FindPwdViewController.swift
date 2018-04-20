//
//  FindPwdViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/20.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class FindPwdViewController: UIViewController {

    @IBOutlet weak var backBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.action = #selector(titleBarLeftBtn)
    }

    //返回键
    @objc func titleBarLeftBtn(){
        self.dismiss(animated: false, completion:nil)
    }
}
