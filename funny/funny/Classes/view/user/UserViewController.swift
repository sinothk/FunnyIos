//
//  UserViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/5/2.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class UserViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var tableView:UITableView?
    var allnames:Dictionary<Int, [String]>?
    var adHeaders:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        self.allnames =  [
            0:[String]([
                "UILabel 标签",
                "UITextField 文本框",
                "UIButton 按钮"]),
            1:[String]([
                "UIDatePiker 日期选择器",
                "UIToolbar 工具条",
                "UITableView 表格视图"])
        ];
        
        print(self.allnames ?? "")
        
        self.adHeaders = [
            "常见 UIKit 控件",
            "高级 UIKit 控件"
        ]
        
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
//        self.tableView!.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
    }
    
    //在本例中，有2个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames?[section]
        return data!.count
    }
    
//    //返回分区头部视图
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = Bundle.main.loadNibNamed("UserViewCellHeader",
//                                                  owner: self, options: nil)?[0] as! UIView
////        let titleLabel = headerView.viewWithTag(1) as! UILabel
////        titleLabel.text = self.adHeaders?[section]
//        return headerView
//    }

//    //返回分区头部高度
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//
        // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的尾部
//        func tableView(_ tableView:UITableView, titleForFooterInSection section:Int) -> String? {
//            let data = self.allnames?[section]
//            return "有\(data!.count)个控件"
//        }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            //为了提供表格显示性能，已创建完成的单元需重复使用
//            let identify:String =
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath)
            cell.accessoryType = .disclosureIndicator  //显示右箭头
            
            let secno = indexPath.section
            var data = self.allnames?[secno]
            
            cell.textLabel?.text = data![indexPath.row]
            // 底部
            cell.selectionStyle = .none
            return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("选中\(indexPath.row)")
//    }
}


