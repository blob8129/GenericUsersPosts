//
//  Coordinator.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/8/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import UIKit


final class Coordinator<U>: InteractorDelegate {
    
    typealias EntityType = U
    var window: UIWindow?
    private var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func didSelected(entity: U) {
        if let user = entity as? User {
            let vc = PostsBuilder().build(with: user.id)
            rootViewController.pushViewController(vc, animated: true)
        }
    }
}

extension Coordinator where EntityType == User {
    func start() {
        window?.rootViewController = rootViewController
        let usersVC = UsersBuilder().build(for: self)
        rootViewController.pushViewController(usersVC, animated: false)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func didSelected(entity: User) {
        
    }
}
