//
//  Conversion.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/8/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


extension Post: Convertible {
    typealias TypeToConvertTo = PostViewModel
    
    func convert() -> PostViewModel {
        return PostViewModel(title: "Title: \(title)", body: "Body: \(body)")
    }
}
