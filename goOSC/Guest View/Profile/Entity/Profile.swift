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
    
    struct Data: Decodable {
        var user_email: String
        var first_name: String
        var last_name: String
    }
    
    struct ResponseFail: Decodable {
        var code: Int
        var message: String
    }
}
