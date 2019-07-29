//
//  MMTextMessageCell.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import MessengerKit

struct Sender: MSGUser {
    var displayName: String
    var avatar: UIImage?
    var isSender: Bool
}

class MessageNew: MSGMessengerViewController {
    
    var messages = [Chat.Detail]()
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        let ms1 = Chat.Detail(chat_id: "", useremail: "rererere", username: "aaaaaa", destination_email: "", destination_name: "", message: "kampay", read: true, type_chat: "chat", chat_date: "")
        let ms2 = Chat.Detail(chat_id: "", useremail: "rererere", username: "aaaaaa", destination_email: "", destination_name: "", message: "kampay", read: true, type_chat: "chat", chat_date: "")
        messages.append(ms1)
        messages.append(ms2)
    }
}

extension MessageNew: MSGDataSource {
    func message(for indexPath: IndexPath) -> MSGMessage {
        let messageData = messages[indexPath.item]
        let sender = Sender(displayName: messageData.username, avatar: nil, isSender: true)
        let msg = MSGMessage(id: 0, body: MSGMessageBody.text(messageData.message), user: sender, sentAt: Date())
        return msg
    }
    
    func numberOfSections() -> Int {
        return messages.count
    }
    
    func numberOfMessages(in section: Int) -> Int {
        return messages.count
    }
    
    func footerTitle(for section: Int) -> String? {
        return "Just now"
    }
    
    func headerTitle(for section: Int) -> String? {
        return messages[section].username
    }
    
}
