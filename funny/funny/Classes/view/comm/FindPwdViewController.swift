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
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var idKeyTxt: UITextField!
    @IBOutlet weak var idKeyBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idKeyBtn.setTitleColor(themeColor, for: UIControlState.normal)
        
        okBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        okBtn.backgroundColor = themeColor
        okBtn.layer.cornerRadius = 6
        
        backBtn.action = #selector(titleBarLeftBtn)
        okBtn.addTarget(self, action: #selector(doOk), for: UIControlEvents.touchUpInside)
        idKeyBtn.addTarget(self, action: #selector(getKey), for: UIControlEvents.touchUpInside)
    }

    //返回键
    @objc func titleBarLeftBtn(){
        self.dismiss(animated: false, completion:nil)
    }
    
    //执行找回
    @objc func doOk(){
        self.dismiss(animated: false, completion:nil)
    }
    
    //MARK: -> 获取验证码
    @objc func getKey(){
        view.makeToast("验证码已发往邮箱", position: .center)
    }
}
