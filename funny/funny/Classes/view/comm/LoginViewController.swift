//
//  LoginViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/19.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var newVersionBtn: UIBarButtonItem!
    @IBOutlet weak var avatarIv: UIImageView!
    @IBOutlet weak var userCodeTxt: UITextField!
    @IBOutlet weak var userPwdTxt: UITextField!
    
    @IBOutlet weak var registerBtn: UIBarButtonItem!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var findPwdBtn: UIButton!
    
    //MARK: -> 提示信息
    func tip(msg:String) -> Void {
        view.makeToast(msg, position: .center)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: -> 初始化界面
    func setupUI() -> Void {
        avatarIv.image = UIImage(named:"NewVersion3")
        avatarIv.layer.cornerRadius = 40
        avatarIv.layer.masksToBounds = true
        
        userCodeTxt.text = "381518188@qq.com"
        
        userPwdTxt.text = "123456"
        userPwdTxt.isSecureTextEntry = true
        
        loginBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginBtn.backgroundColor = themeColor
        loginBtn.layer.cornerRadius = 6
        
        newVersionBtn.action = #selector(titleBarLeftBtn)
        registerBtn.action = #selector(titleBarRightBtn)
        
        loginBtn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        findPwdBtn.addTarget(self, action: #selector(findPwd), for: UIControlEvents.touchUpInside)
    }
    
    //MARK: -> 进入版本介绍
    @objc func titleBarLeftBtn(){
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification),
            object: "NewVersionViewController")
    }
    
    //MARK: -> 注册
    @objc func titleBarRightBtn(){
//        NotificationCenter.default.post(
//            name: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification),
//            object: "RegisterViewController")
        let nib = RegisterViewController()//需要跳转的viewcontroller
        self.present(nib, animated:false, completion: nil)
    }
    
    // MARK: -> 点击登录
    @objc func login(){
        let userCode = userCodeTxt.text
        let userPwd = userPwdTxt.text
        
        // 账号合法性检测
        let isInputEnable = LoginViewModel.shared.checkEnable(view: self, userCode: userCode!, userPwd: userPwd!)
        let networkOk = NetworkUtil.shared.isEnable()
        
        if isInputEnable && networkOk {
            // 执行登录
            LoginViewModel.shared.login(accountStr: userCode!, pwdStr: userPwd!) { (isOk) in
                if isOk {
                    NotificationCenter.default.post(
                        name: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification),
                        object: "MainViewController")
                } else{
                    print("用户登录失败")
                }
            }
        }
    }

    @objc func findPwd() -> Void {
        let nib = FindPwdViewController()//需要跳转的viewcontroller
        self.present(nib, animated:false, completion: nil)
    }
}
