//
//  MessageManager.swift
//  goOSC
//
//  Created by Bootcamp on 26/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

//import NOCProtoKit

//protocol MessageManagerDelegate: class {
//    func didReceiveMessages(messages: [MessageNew], chatId: String)
//}
//
//class MessageManager: NSObject, NOCClientDelegate {
//    
//    private var delegates: NSHashTable<AnyObject>
//    private var client: NOCClient
//    
//    private var messages: Dictionary<String, [MessageNew]>
//    
//    override init() {
//        delegates = NSHashTable<AnyObject>.weakObjects()
//        client = NOCClient(userId: User.currentUser.userId)
//        messages = [:]
//        super.init()
//        client.delegate = self
//    }
//    
//    static let manager = MessageManager()
//    
//    func play() {
//        client.open()
//    }
//    
//    func fetchMessages(withChatId chatId: String, handler: ([MessageNew]) -> Void) {
//        if let msgs = messages[chatId] {
//            handler(msgs)
//        } else {
//            var arr = [MessageNew]()
//            
//            let msg = MessageNew()
//            msg.msgType = "Date"
//            arr.append(msg)
//            
//            if chatId == "bot_89757" {
//                let msg = MessageNew()
//                msg.msgType = "System"
//                msg.text = "Welcome to Gothons From Planet Percal #25! Please input `/start` to play!"
//                arr.append(msg)
//            }
//            
//            saveMessages(arr, chatId: chatId)
//            
//            handler(arr)
//        }
//    }
//    
//    func sendMessage(_ message: MessageNew, toChat chat: Chat) {
//        let chatId = chat.chatId
//        
//        saveMessages([message], chatId: chatId)
//        
//        let dict = [
//            "from": message.senderId,
//            "to": chat.targetId,
//            "type": message.msgType,
//            "text": message.text,
//            "ctype": chat.type
//        ]
//        
//        client.sendMessage(dict)
//    }
//    
//    func addDelegate(_ delegate: MessageManagerDelegate) {
//        delegates.add(delegate)
//    }
//    
//    func removeDelegate(_ delegate: MessageManagerDelegate) {
//        delegates.remove(delegate)
//    }
//    
//    func clientDidReceiveMessage(_ message: [AnyHashable : Any]) {
//        guard let senderId = message["from"] as? String,
//            let type = message["type"] as? String,
//            let text = message["text"] as? String,
//            let chatType = message["ctype"] as? String else {
//                return;
//        }
//        
//        if type != "Text" || chatType != "bot" {
//            return;
//        }
//        
//        let msg = MessageNew()
//        msg.senderId = senderId
//        msg.msgType = type
//        msg.text = text
//        msg.isOutgoing = false
//        
//        let chatId = chatType + "_" + senderId
//        
//        saveMessages([msg], chatId: chatId)
//        
//        for delegate in delegates.allObjects {
//            if let d = delegate as? MessageManagerDelegate {
//                d.didReceiveMessages(messages: [msg], chatId: chatId)
//            }
//        }
//    }
//    
//    private func saveMessages(_ messages: [MessageNew], chatId: String) {
//        var msgs = self.messages[chatId] ?? []
//        msgs += messages
//        self.messages[chatId] = msgs
//    }
//    
//}
