//
//  RegisterViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/20.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pwdTxt: UITextField!
    @IBOutlet weak var pwd2Txt: UITextField!
    
    @IBOutlet weak var titleLeftBtn: UIBarButtonItem!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var likeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pwdTxt.isSecureTextEntry = true
        pwd2Txt.isSecureTextEntry = true
        
        okBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        okBtn.backgroundColor = themeColor
        okBtn.layer.cornerRadius = 6
        
        titleLeftBtn.action = #selector(titleBarLeftBtn)
        okBtn.addTarget(self, action: #selector(doRegiter), for: UIControlEvents.touchUpInside)
        likeBtn.addTarget(self, action: #selector(disclaimer), for: UIControlEvents.touchUpInside)
    }
    
    //返回键
    @objc func titleBarLeftBtn(){
        self.dismiss(animated: false, completion:nil)
    }
    
    // 免责声明
    @objc func disclaimer(){
//        NotificationCenter.default.post(
//            name: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification),
//            object: "NewVersionViewController")
        let vc = DisclaimerViewController()//()WKWebViewViewController
        self.present(vc,animated: false,completion: nil)
    }
    
    // 注册事件
    @objc func doRegiter(){
        self.dismiss(animated: false, completion:nil)
    }
}
