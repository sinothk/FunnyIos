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
//    var allnames:Dictionary<Int, [String]>?
    
    var settingListData :Dictionary<Int, [SettingItemEntity]>?

    var adHeaders:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //初始化数据，这一次数据，我们放在属性列表文件里
//        self.allnames =  [
//            0:[String]([
//                "UILabel 标签",
//                "UITextField 文本框",
//                "UIButton 按钮"]),
//
//            1:[String]([
//                "UIDatePiker 日期选择器",
//                "UIToolbar 工具条",
//                "UITableView 表格视图"]),
//
//            2:[String]([
//                "设置"])
//        ];
   
        self.settingListData = [
            0:[SettingItemEntity]([
                SettingItemEntity(icon: "ic_nav_nearby_normal", name: "关注"),
                SettingItemEntity(icon: "ic_nav_nearby_normal", name: "粉丝")
                ]),
            1:[SettingItemEntity]([
                SettingItemEntity(icon: "ic_nav_nearby_normal", name: "足迹"),
                SettingItemEntity(icon: "ic_nav_nearby_normal", name: "我的访客"),
                SettingItemEntity(icon: "ic_nav_nearby_normal", name: "我的收藏")
                ]),
            2:[SettingItemEntity]([
                SettingItemEntity(icon: "ic_nav_nearby_normal", name: "设置")
                ])
        ]
        
        
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
        self.tableView?.tableHeaderView = UserTopView().show(info: user)
        
        //创建一个重用的单元格
        self.tableView!.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingTableViewCell")
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
        return (self.settingListData?.count) ?? 0;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.settingListData?[section]//self.allnames?[section]
        return data!.count
    }

    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //            //为了提供表格显示性能，已创建完成的单元需重复使用
        //            let identify:String =
        //同一形式的单元格重复使用，在声明时已注册
//        let cell:SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        let cell = SettingTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "SettingTableViewCell")
        
        // 底部
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator  //显示右箭头
        
        let secno = indexPath.section
        let row = indexPath.row
        
        let itemInfo: SettingItemEntity = self.settingListData![secno]![row]
        
        cell.itemInfo = itemInfo
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let secno = indexPath.section
        
        print("选中\(secno)组，\(indexPath.row)")
    }
}
