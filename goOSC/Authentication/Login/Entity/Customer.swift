//
//  Customer.swift
//  goOSC
//
//  Created by Bootcamp on 28/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
enum Customer {
    struct Request {
        var name: String
        var email: String
        var password: String
        
        init(name: String, email: String, password: String) {
            self.name = name
            self.email = email
            self.password = password
        }
    }
    
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: ResponseData?
        
    }
    
    struct ResponseData: Decodable {
        var user: SingleUser?
    }
    
    struct SingleUser: Decodable {
        var id: Int
        var email: String
        var password: String
        var firstname: String
        var lastname: String
        var role_id: Int
        var role_name: String
        var origin: String
    }
    
}
