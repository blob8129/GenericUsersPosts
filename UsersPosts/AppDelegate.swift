//
//  AppDelegate.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/6/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator<User>?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        coordinator = Coordinator<User>(rootViewController: navigationController)
        coordinator?.window = window
        coordinator?.start()
        return true
    }
}

