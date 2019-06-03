//
//  User.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

enum User {
    struct UserData {
        var firstName: String
        var lastName: String
        var email: String
        var password: String
        
        init(firstName: String, lastName: String, email: String, password: String) {
            self.firstName = firstName
            self.lastName = lastName
            self.email = email
            self.password = password
        }
    }
    
    struct RegistrationResponse: Decodable {
        var code: Int
        var message: String
        var data: [String]
    }
}

