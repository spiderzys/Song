//
//  AppDelegate.swift
//  Song
//
//  Created by Yangsheng Zou on 2021-01-29.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = ControllerGenerator.getController(type: .SongList(length: 10))
        
        window?.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        return true
        
        
    }

    // MARK: UISceneSession Lifecycle


}

