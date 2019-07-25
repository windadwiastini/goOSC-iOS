//
//  Chat.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

enum Chat {
    struct ResponseDetail: Decodable {
        var code: Int
        var message: String
        var data: [Detail]
    }
    
    struct Detail: Decodable {
        var chat_id: String
        var useremail: String
        var username: String
        var destination_email: String
        var destination_name: String
        var message: String
        var read: Bool
        var type_chat: String
        var chat_date: String
    }
    
    struct MessageDetail: Decodable {
        var From: String
        var `Type`: String
        var Message: String
    }
}
