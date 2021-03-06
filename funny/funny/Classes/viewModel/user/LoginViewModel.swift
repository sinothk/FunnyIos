//
//  UserViewModel.swift
//  funny
//
//  Created by gyzkhy on 2018/4/19.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class LoginViewModel{
    static let shared = LoginViewModel()
    
    func checkEnable( view: LoginViewController, userCode:String, userPwd:String) -> Bool {
        
        if userCode.count == 0{
            view.tip(msg: "请输入账号或邮箱")
            return false
        }
        
        if userPwd.count == 0{
            view.tip(msg: "请输入密码")
            return false
        }
        
        return true
    }

    // MARK：- 登录
    func login(accountStr:String, pwdStr:String, finished:(_ success: Bool) -> Void){
        
        let isSuccess = true // false //
        
//        if isSuccess{
//            let user = UserAccount(uid: accountStr,screen_name: "LYT" , avatar_large: "28", isLogin: true)
//            // 归档方式1:
//            //        user.saveUserAccount()
//            // 归档方式2:
//            NSKeyedArchiver.archiveRootObject(user, toFile: self.accpuntPath)
//        }
        
        // 回调
        finished(isSuccess)
    }
}
