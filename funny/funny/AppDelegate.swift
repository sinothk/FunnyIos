//
//  AppDelegate.swift
//  funny
//
//  Created by gyzkhy on 2018/4/16.
//  Copyright © 2018年 贵州中科恒运. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // 设置全局属性
        setupAppearance()

        window = UIWindow(frame:UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = LoginViewController() //NewVersionViewController()
        window?.makeKeyAndVisible()
        
        // 监听通知
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: WBSwitchRootViewControllerNotification),
                                               object:nil,queue:nil,using:
            {[weak self](notification) -> Void in
                
                var vc:UIViewController? = nil
                
                let mark:String = notification.object as! String
                
                if mark == "LoginViewController"{
                    vc = LoginViewController()
                    
                }else if mark == "MainViewController"{
                    vc = MainViewController()
                    
                }else if mark == "NewVersionViewController"{
                    vc = NewVersionViewController()
                }
                
                
           
//                let vc = MineViewController()//notification.object != nil ? WelcomeViewController() : MainViewController()
                
                // 跳转到Main
                self?.window?.rootViewController = vc
        })
        
        return true
    }

    // 注销
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name(
                                                    rawValue: WBSwitchRootViewControllerNotification),
                                                  object: nil)
    }
    
    //MARK:设置全局外观:一旦设置，全局控件有效。
    private func setupAppearance(){
        // 标题部分
        UINavigationBar.appearance().tintColor = UIColor.orange
        // tab颜色
        UITabBar.appearance().tintColor = UIColor.orange
    }
    
//    func applicationWillResignActive(_ application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }


}

