//
//  MineMainViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/5/2.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class MineMainViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
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
   
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //        self.tableView!.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)

        let user = UserEntity()
        user.name = "SINOTHK"
        user.headerBg = "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1626039801,2689375718&fm=27&gp=0.jpg"
        user.avatar = "http://sinothk.com/images/about.png"
        user.keyword = "创造共享，天下为公"
        self.tableView?.tableHeaderView = UserAbstractView().show(info: user)
        
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        preareTableView()
        self.view.addSubview(self.tableView!)
        
//        self.tableView.table
    }
    
    //MARK: - 准备表格
    private func preareTableView(){
        self.tableView?.estimatedRowHeight = 100
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        
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

    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //            //为了提供表格显示性能，已创建完成的单元需重复使用
        //            let identify:String =
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath)
        // 底部
        cell.selectionStyle = .none
        
        let secno = indexPath.section

        cell.accessoryType = .disclosureIndicator  //显示右箭头
            
        var data = self.allnames?[secno]
        cell.textLabel?.text = data![indexPath.row]

        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中\(indexPath.row)")
    }
}
