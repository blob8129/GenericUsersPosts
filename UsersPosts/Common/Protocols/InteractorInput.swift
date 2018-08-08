//
//  InteractorInput.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/8/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


protocol InteractorInput where ViewModelConvertibleType: Convertible & Decodable, ViewModelConvertibleType.TypeToConvertTo == ViewModelType {
    associatedtype ViewModelConvertibleType
    associatedtype ViewModelType
    
    var entities: [ViewModelConvertibleType] { get set}
    func viewModel(at indexPath: IndexPath) -> ViewModelConvertibleType
    func viewDidLoad()
}
