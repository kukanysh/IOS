//
//  ViewModel.swift
//  mvvm
//
//  Created by Куаныш Спандияр on 02.01.2024.
//

import Foundation
import UIKit.UIColor

class ViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password {
            statusText.value = "Login failed."
            statusColor.value = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        } else {
            statusText.value = "You succesfully logged in!"
            statusColor.value = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
    }
    
}
