//
//  PostsBuilder.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/8/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import UIKit


final class PostsBuilder {
    
    func build(with userId: Int) -> UIViewController {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)")!
        
        let interactor = Interactor<Post, PostViewModel, Coordinator<Post>>(networkService: NetworkService(),
                                                                            url: url,
                                                                            decoder: JSONDecoder())
        let vc = ViewVC<PostViewModel, Interactor<Post, PostViewModel, Coordinator<Post>>, PostTVCell>()
        interactor.view = vc
        vc.interactor = interactor
        return vc
    }
}
