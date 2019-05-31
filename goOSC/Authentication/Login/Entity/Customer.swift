//
//  Customer.swift
//  goOSC
//
//  Created by Bootcamp on 28/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

struct Customer {
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
