//
//  Convertible.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/7/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


protocol Convertible {
    associatedtype TypeToConvertTo
    func convert() -> TypeToConvertTo
}
