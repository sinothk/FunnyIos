//
//  SpoorAddViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/25.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class SpoorAddViewController: UIViewController {

    @IBOutlet weak var titleLeftBtn: UIBarButtonItem!
    @IBOutlet weak var titleRightBtn: UIBarButtonItem!
    
    @IBOutlet weak var inputTxt: UITextView!
    
    func initTitle() -> Void {
        titleLeftBtn.action = #selector(closeVC)
        titleRightBtn.action = #selector(addSpoor)
    }
    
    @objc func closeVC() -> Void {
        self.dismiss(animated: false, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTitle()
        
        inputTxt.layer.borderWidth = 1  //边框粗细
        inputTxt.layer.borderColor = UIColor.lightGray.cgColor //边框颜色
        inputTxt.layer.cornerRadius = 6
    }

    @objc func addSpoor() -> Void {
        let intpuValue:String = inputTxt.text
        print(intpuValue)
        closeVC()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
