//
//  Chat.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import MessengerKit
enum Chat {
    struct ResponseDetail: Decodable {
        var code: Int
        var message: String
        var data: [Detail]
    }
    
    struct Detail: Codable {
        var chatId: String
        var userEmail: String
        var username: String
        var destinationEmail: String
        var destinationName: String
        var message: String
        var read: Bool
        var typeChat: String
        var chatDate: String
        
        enum CodingKeys: String, CodingKey {
            case message, read, username
            case chatId = "chat_id"
            case userEmail = "useremail"
            case destinationEmail = "destination_email"
            case destinationName = "destination_name"
            case typeChat = "type_chat"
            case chatDate = "chat_date"
        }
    }
    
    struct MessageDetail: Codable {
        var from: String
        var type: String
        var message: String
        
        enum CodingKeys: String, CodingKey {
            case from = "From"
            case type = "Type"
            case message = "Message"
        }
    }
    
    struct Sender: MSGUser {
        var displayName: String
        var avatar: UIImage?
        var isSender: Bool
    }
}
