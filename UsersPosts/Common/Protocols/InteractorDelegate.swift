//
//  InteractorDelegate.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/8/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


protocol InteractorDelegate: class {
    associatedtype EntityType
    func didSelected(entity: EntityType)
}
