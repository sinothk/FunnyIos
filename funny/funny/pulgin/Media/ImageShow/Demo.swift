//
//  Demo.swift
//  funny
//
//  Created by gyzkhy on 2018/4/27.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

////MARK: -图片点击事件
//func onClickImageView(imageSrcs: [String], index: Int) {
//    print(imageSrcs[index])
//
//    // 1. create URL Array
//    var images = [SKPhoto]()
//    for imageSrc in imageSrcs {
//        let photo = SKPhoto.photoWithImageURL(imageSrc)
//        photo.shouldCachePhotoURLImage = false // you can use image cache by true(NSCache)
//        images.append(photo)
//    }
//    // 2. create PhotoBrowser Instance, and present.
//    let browser = SKPhotoBrowser(photos: images)
//    browser.initializePageIndex(index)
//    //
//    vc?.present(browser, animated: true, completion: {})
//}
