//
//  UsersBuilder.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/7/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import UIKit


final class UsersBuilder {
    
    func build(for delegate: Coordinator<User>?) -> UIViewController {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let interactor = Interactor<User, UserViewModel, Coordinator<User>>(networkService: NetworkService(),
                                        url: url,
                                        decoder: JSONDecoder())
        let vc = ViewVC<UserViewModel, Interactor<User, UserViewModel, Coordinator<User>>, UserTVCell>()
        interactor.view = vc
        vc.interactor = interactor
        interactor.delegate = delegate
        return vc
    }
}
