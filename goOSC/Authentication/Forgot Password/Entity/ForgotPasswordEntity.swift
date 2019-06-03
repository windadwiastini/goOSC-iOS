//
//  ForgotPasswordEntity.swift
//  goOSC
//
//  Created by Bootcamp on 03/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
enum ForgotPassword {
    struct Request {
        var email: String
    }
    
    struct Response: Decodable {
        var code: Int
        var message: String
    }
}
