//
//  ViewModelConfigurable.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/8/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


protocol ViewModelConfigurable {
    associatedtype ViewModelType
    func configure(for viewModel: ViewModelType)
}
