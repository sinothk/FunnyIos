//
//  HomeTableViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/23.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

let indentifier = "HomeTableViewCell"

class HomeTableViewController: UITableViewController {
    
    var count  = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: indentifier)
        preareTableView()
        
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
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
        return 100
    }
 
//    //在本例中，只有一个分区
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1;
//    }

    //MARK: 准备表格
    private func preareTableView(){
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中\(indexPath.row)")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: indentifier)
        
        cell.setData(position: indexPath.row)
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
