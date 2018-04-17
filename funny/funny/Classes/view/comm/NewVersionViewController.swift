//
//  NewVersionViewController.swift
//  funny
//
//  Created by gyzkhy on 2018/4/17.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

private let WBNewFeatureViewCellId = "NewFeatureViewCellId"
private let WBNewFeatureImageCount = 3
private let reuseIdentifier = "Cell"

class NewVersionViewController: UICollectionViewController {

    // Mark: - 构造函数
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = UIScreen.main.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: layout)
        
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        collectionView?.showsHorizontalScrollIndicator = false
        
    }
    
//    //隐藏状态栏
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView!.register(NewFeatureCell.self, forCellWithReuseIdentifier: WBNewFeatureViewCellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WBNewFeatureImageCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WBNewFeatureViewCellId, for: indexPath) as! NewFeatureCell
        
        cell.imageIndex = indexPath.item
        return cell
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        
        if page != WBNewFeatureImageCount - 1{
            return
        }
        // 播放动画
        let cell = collectionView?.cellForItem(at: NSIndexPath(item: page, section: 0) as IndexPath) as! NewFeatureCell
        cell.showButtonAnim()
    }
}

private class NewFeatureCell: UICollectionViewCell {
    
    var imageIndex = 0{
        didSet{
            iconView.image = UIImage(named:"NewVersion\(imageIndex+1)")
            startBtn.isHidden = true
        }
    }
    
    func showButtonAnim(){
        startBtn.isHidden = false
        
        startBtn.transform = CGAffineTransform(scaleX: 0,y: 0)
        
        UIView.animate(withDuration: 1.0,           // 动画时长
            delay: 0,                    // 延时时间
            usingSpringWithDamping:0.6,  // 弹力系数，0到1之间，越小越弹。
            initialSpringVelocity:10,    // 初始速度
            options:[],                  // 动画选项
            animations: {
                self.startBtn.transform = CGAffineTransform.identity
        }) { (_) in
            print("OK")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(iconView)
        iconView.frame = bounds
        iconView.backgroundColor = UIColor.blue
        
        addSubview(startBtn)
        startBtn.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: startBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: startBtn, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -50))
        //
        startBtn.addTarget(self, action: #selector(startUse), for: .touchUpInside)
    }
    
    @objc private func startUse(){
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification),
            object: nil)
    }
    
    private lazy var iconView: UIImageView = UIImageView()
    private lazy var startBtn:UIButton = UIButton(title:"开始陌陌", color:UIColor.orange, imageName:"test_2")

}
