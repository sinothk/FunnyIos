//
//  ProgressHelper.swift
//  Inspection
//
//  Created by gyzkhy on 2018/3/20.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import SVProgressHUD

public class ProgressHelper{

    static let shared = ProgressHelper()
    private init(){
        SVProgressHUD.setForegroundColor(UIColor.orange)
        SVProgressHUD.setBackgroundColor(UIColor.black)
    }
    
    public func showLoading(msg: String){
        SVProgressHUD.show(withStatus: msg)
    }
    
    public func tip(msg: String){
        SVProgressHUD.showInfo(withStatus: msg)
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    public func dismiss(){
        SVProgressHUD.dismiss()
    }
}
