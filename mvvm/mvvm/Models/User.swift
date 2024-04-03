//
//  User.swift
//  mvvm
//
//  Created by Куаныш Спандияр on 02.01.2024.
//

import Foundation


struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [
        User(login: "kuka", password: "2605")
    
    ]
}
