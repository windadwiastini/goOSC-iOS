//
//  ChatView.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Starscream
import IQKeyboardManagerSwift
import MessengerKit

struct Sender: MSGUser {
    var displayName: String
    var avatar: UIImage?
    var isSender: Bool
}

class ChatView: MSGMessengerViewController, ChatViewProtocol {
    var presenter: ChatPresenterProtocol?
    
    var messages  = [Chat.Detail]()
    
    @IBOutlet weak var msgTextField: UITextField!

    fileprivate var socket = WebSocket(url: URL(string: "ws://goosc.herokuapp.com/ws?useremail=\(Auth().email)&destemail=admin@goosc.com&username=renikumalawati&type=admin")!, protocols: ["chat"])
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatWireFrame.createChatModule(self)
        socket.delegate = self
        socket.connect()
        presenter?.viewDidLoad()
        IQKeyboardManager.sharedManager().enable = false
        IQKeyboardManager.sharedManager().enableAutoToolbar = false
        dataSource = self
    }

    deinit {
        socket.disconnect(forceTimeout: 0)
        socket.delegate = nil
    }

    @IBAction func goToPreviousPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateMessage(response resp: Chat.ResponseDetail) {
        messages = []
        messages = resp.data
        collectionView.reloadData()
        collectionView.scrollToBottom(animated: true)
    }
    
    override func inputViewPrimaryActionTriggered(inputView: MSGInputView) {
        let newMsg = Chat.Detail(chat_id: "", useremail: Auth().email, username: Auth().firstName, destination_email: "", destination_name: "", message: inputView.message, read: false, type_chat: "chat", chat_date: "")
        messages.append(newMsg)
        collectionView.reloadData()
        let jsonObject: [String: String] = ["Message": inputView.message]
        let stringify = JsonManipulate().JSONStringify(value: jsonObject)
        socket.write(string: stringify)
    }
    
}

extension ChatView:WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }

    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }

    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        let jsonDecode = try! JSONDecoder().decode(Chat.MessageDetail.self, from: text.data(using: .utf8)!)
        let newMsg = Chat.Detail(chat_id: "", useremail: "admin@goosc.com", username: jsonDecode.From, destination_email: "", destination_name: "", message: jsonDecode.Message, read: false, type_chat: jsonDecode.Type, chat_date: "")
        messages.append(newMsg)
    }

    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("ambil data eoi")
    }
}

extension ChatView: MSGDataSource {
    func message(for indexPath: IndexPath) -> MSGMessage {
        let messageData = messages[indexPath.item]
        var isSender = true
        if Auth().email == messageData.useremail {
            isSender = false
        }
        
        let sender = Sender(displayName: messageData.username, avatar: nil, isSender: isSender)
        let msg = MSGMessage(id: 0, body: MSGMessageBody.text(messageData.message), user: sender, sentAt: Date())
        return msg
    }
    
    func numberOfSections() -> Int {
        var number = 0
        if messages.count > 0 {
            number = 1
        }
        return number
    }
    
    func numberOfMessages(in section: Int) -> Int {
        print(messages.count)
        return messages.count
    }
    
    func footerTitle(for section: Int) -> String? {
        return "Just now"
    }
    
    func headerTitle(for section: Int) -> String? {
        return messages[section].username
    }
}
