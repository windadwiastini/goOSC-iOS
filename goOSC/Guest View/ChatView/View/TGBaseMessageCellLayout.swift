//
//  TGBaseMessageCellLayout.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import NoChat

class TGBaseMessageCellLayout: NSObject, NOCChatItemCellLayout {
    
    var reuseIdentifier: String = "TGBaseMessageCell"
    var chatItem: NOCChatItem
    var width: CGFloat
    var height: CGFloat = 0
    
    var message: Message {
        return chatItem as! Message
    }
    var isOutgoing: Bool {
        return message.isOutgoing
    }
    
    let bubbleViewMargin = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 2)
    var bubbleViewFrame = CGRect.zero
    
    required init(chatItem: NOCChatItem, cellWidth width: CGFloat) {
        self.chatItem = chatItem
        self.width = width
        super.init()
    }
    
    func calculate() {
        
    }
    
}
