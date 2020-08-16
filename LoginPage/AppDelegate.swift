//
//  AppDelegate.swift
//  LoginPage
//
//  Created by kuh on 17/07/20.
//  Copyright © 2020 kuhCompany. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let storyboard = UIStoryboard(name: "LoginController", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "LoginController") as! LoginController
        let navigation = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigation
        return true
    }
}

