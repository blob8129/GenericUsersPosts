//
//  Conversion.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/8/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


extension Address: CustomStringConvertible {
    var description: String {
        return "\(city) \(street) \(suite) \(zipcode)"
    }
}

extension User: Convertible {
    func convert() -> UserViewModel {
        return UserViewModel(name: name,
                             userName: username,
                             email: email,
                             address: address.description)
    }
    
    typealias TypeToConvertTo = UserViewModel
}
