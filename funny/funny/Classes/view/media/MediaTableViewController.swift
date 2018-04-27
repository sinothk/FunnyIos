//
//  MediaTableViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/26.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

class MediaTableViewController: UITableViewController {

    var count = 30
    
    @objc func add() -> Void {
        let vc = SpoorAddViewController()
        self.present(vc,animated: false,completion: nil)
    }
    
    //MARK: - 准备表格
    private func preareTableView(){
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.showsVerticalScrollIndicator = false // 隐藏右边滚动条
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"icon_add_grey"), style: .plain, target: self,action:#selector(add))
        
        initTable()
    }

    func initTable() -> Void {
        tableView.register(MediaTableViewCell.self, forCellReuseIdentifier: "MediaTableViewCell")
        preareTableView()

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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中\(indexPath.row)")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTableViewCell", for: indexPath) as! MediaTableViewCell

        let spoorEntity = SpoorEntity()

        let user = UserEntity()
        user.name  = "小鸣\(indexPath.row+1)"
        user.headerBg = "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1626039801,2689375718&fm=27&gp=0.jpg"

        let position = indexPath.row % 3
        if position == 0 {
            user.avatar = "http://sinothk.com/images/about.png"
        } else if position == 1{
            user.avatar = "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3777983027,912569445&fm=27&gp=0.jpg"
        } else {
            user.avatar = "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2260172143,4248424328&fm=27&gp=0.jpg"
        }

        user.keyword = "创造共享，天下为公"
        spoorEntity.user = user

        spoorEntity.contentTxt = "当时，魏王李泰宠冠诸王，大修第宅，岑文本以为奢侈之风不可长，便上疏极力说明节俭的重要意义，对魏王泰的奢侈挥霍要有所抑制。太宗称赞他的意见，遂赐帛三百段。贞观十七年，加银青光禄大夫。"

        var imgs = Array<String>()
        imgs.append("http://upload1.techweb.com.cn/s/139/2018/0322/1521684876525.jpg")
        imgs.append("http://upload1.techweb.com.cn/s/139/2018/0322/1521684917565.png")
        imgs.append("http://upload1.techweb.com.cn/s/139/2018/0322/1521686276466.jpg")
        imgs.append("http://upload1.techweb.com.cn/s/139/2018/0322/1521686348168.jpg")
        
        spoorEntity.imgUrl = imgs
        
        let imageSrcs: [String] = ["http://upload1.techweb.com.cn/s/139/2018/0322/1521684876525.jpg",
                                   "http://upload1.techweb.com.cn/s/139/2018/0322/1521684917565.png",
                                   "http://upload1.techweb.com.cn/s/139/2018/0322/1521686276466.jpg",
                                   "http://upload1.techweb.com.cn/s/139/2018/0322/1521686348168.jpg"]
        spoorEntity.imageSrcs = imageSrcs
        
        cell.spoorEntity = spoorEntity

        return cell
    }
}
