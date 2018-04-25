//
//  SpoorTableViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/25.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class SpoorTableViewController: UITableViewController {

    var count  = 30
    
    @objc func addSpoor() -> Void {
        let vc = SpoorAddViewController()
        self.present(vc,animated: false,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"icon_add_grey"), style: .plain, target: self,action:#selector(addSpoor))
//        initTitle()
        
        initTable()
    }
    
    func initTable() -> Void {
        let cellNib = UINib(nibName: "SpoorTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "cellId")
        
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.sy_header = TextHeaderFooter(
            normalText: "1", // VerticalHintText.headerNomalText
            pullingText: "下拉刷新", //VerticalHintText.headerPullingText
            refreshingText: "正在刷新", //VerticalHintText.headerRefreshText
            nomoreDataText:nil,
            orientation: .top,
            height: 60,
            font: UIFont.systemFont(ofSize: 14),
            color: UIColor.black,
            completion: { [weak self] in

                //                let data = StatusViewModel.shared.load(page: 0,pageSize: 20)

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.tableView.sy_header?.endRefreshing()
                    self?.count = 30
                    self?.tableView.reloadData()
                }
        })

        tableView.sy_footer = TextHeaderFooter(
            normalText: VerticalHintText.footerNomalText,
            pullingText: VerticalHintText.footerPullingText,
            refreshingText: VerticalHintText.footerRefreshText,
            nomoreDataText:"没有更多数据了",
            orientation: .bottom,
            height: 60,
            font: UIFont.systemFont(ofSize: 14),
            color: UIColor.black,
            completion: { [weak self] in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if (self?.count)! >= 130 {
                        self?.tableView.sy_footer?.noMoreData()
                    }else{
                        self?.count += 20
                        self?.tableView.sy_footer?.endRefreshing()
                    }
                    self?.tableView.reloadData()
                }
        })

        tableView.sy_header?.beginRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    //单元格高度
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath section: Int) -> CGFloat {
        return UITableViewAutomaticDimension// 250//
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中\(indexPath.row)")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SpoorTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cellId") as! SpoorTableViewCell
        
        cell.userAvatar.show(url:"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1626039801,2689375718&fm=27&gp=0.jpg")
        cell.userName.text = "No.\(indexPath.row)"
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
