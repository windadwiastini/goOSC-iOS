//
//  MessageNew.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import NoChat

enum MessageDeliveryStatus {
    case Idle
    case Delivering
    case Delivered
    case Failure
    case Read
}

class MessageNew: NSObject, NOCChatItem {
    
    var msgId: String = UUID().uuidString
    var msgType: String = "Text"
    
    var senderId: String = ""
    var date: Date = Date()
    var text: String = ""
    
    var isOutgoing: Bool = true
    var deliveryStatus: MessageDeliveryStatus = .Idle
    
    public func uniqueIdentifier() -> String {
        return self.msgId;
    }
    
    public func type() -> String {
        return self.msgType
    }
    
}
