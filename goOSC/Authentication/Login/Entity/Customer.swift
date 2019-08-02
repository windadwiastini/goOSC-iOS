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
        var token: String
    }
    
    struct SingleUser: Codable {
        var id: Int
        var email: String
        var password: String
        var firstName: String
        var lastName: String
        var roleID: Int
        var roleName: String
        var origin: String
        
        enum CodingKeys: String, CodingKey {
            case id, email, password, origin
            case firstName = "firstname"
            case lastName = "lastname"
            case roleID = "role_id"
            case roleName = "role_name"
        }
    }
    
}
