//
//  LoginViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/19.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var registerBtn: UIBarButtonItem!
    @IBOutlet weak var avatarIv: UIImageView!
    @IBOutlet weak var userCodeTxt: UITextField!
    @IBOutlet weak var userPwdTxt: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var findPwdBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    // MARK: ->初始化界面
    func setupUI() -> Void {
        avatarIv.image = UIImage(named:"NewVersion3")
        avatarIv.layer.cornerRadius = 40
        avatarIv.layer.masksToBounds = true
        
        userCodeTxt.text = "381518188@qq.com"
        
        userPwdTxt.text = "123456"
        userPwdTxt.isSecureTextEntry = true
        
        registerBtn.action = #selector(titleBarRightBtn)
        loginBtn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
    }
    
    @objc func titleBarRightBtn(){
        print("注册")
    }
    
    @objc func login(){
        
        
        UserViewModel.shared.login(accountStr: "", pwdStr: "") { (isOk) in
            if isOk {
                print("isOk")
            } else{
                print("isNotOk")
            }
        }
    }
}
