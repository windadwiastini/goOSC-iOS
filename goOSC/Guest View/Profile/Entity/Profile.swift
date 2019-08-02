//
//  Profile.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct Profile {
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: [Data]
    }
    
    struct Data: Codable {
        var userEmail: String
        var firstName: String
        var lastName: String
        
        enum CodingKeys: String, CodingKey {
            case userEmail = "user_email"
            case firstName = "first_name"
            case lastName = "last_name"
        }
    }
    
    struct ResponseFail: Decodable {
        var code: Int
        var message: String
    }
}
