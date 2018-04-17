//
//  OAuthViewController.swift
//  Inspection
//Users/gyzkhy/Documents/LiangYT/Gitee/Inspection/Inspection/Inspection.xcodeproj/
//  Created by gyzkhy on 2018/3/15.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK:- 关闭窗口
    @objc private func closeView(){
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "用户登录"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"返回", style: .plain, target:self, action:#selector(closeView))
        view.backgroundColor = UIColor.white
        
        //        ProgressHelper.shared.showLoading(msg: "  登录中  ")
        
//        UserAccountViewModel.shared.login(accountStr: "333", pwdStr: "444") { (isSuccess) in
//            if !isSuccess {
//                print("失败")
//                ProgressHelper.shared.tip(msg: "登录失败,请稍后重试")
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
//                    self.closeView()
//                })
//
//                return
//            }else{
//                print("成功")
//
//                //   更新登录状态
//                UserAccountViewModel.shared.updateLoginStatus()
//
//                // 删除当前页
//                self.dismiss(animated: false, completion: {
//                    // 发送切换页面通知：
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification), object: "welcome")
//                })
//            }
//        }
    }
}

