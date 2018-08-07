//
//  User.swift
//  UsersPosts
//
//  Created by Andrey Volobuev on 8/7/18.
//  Copyright © 2018 blob8129. All rights reserved.
//

import Foundation


struct User: Codable {
    let id: Int
    //First and Last Name of the user
    let name: String
    let userName: String
    let email: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}

extension Address: CustomStringConvertible {
    var description: String {
        return "\(city) \(street) \(suite) \(zipcode)"
    }
}

struct UserViewModel {
    let name: String
    let userName: String
    let email: String
    let address: String
}

extension User: Convertible {
    func convert() -> UserViewModel {
        return UserViewModel(name: name,
                             userName: userName,
                             email: email,
                             address: address.description)
    }
    
    typealias TypeToConvertTo = UserViewModel
}
