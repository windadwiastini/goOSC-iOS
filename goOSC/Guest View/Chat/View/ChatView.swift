//
//  ChatView.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Starscream
import MessengerKit
class ChatView: MSGMessengerViewController, ChatViewProtocol {
    weak var presenter: ChatPresenterProtocol?
    fileprivate var messages  = [Chat.Detail]()
    fileprivate var socket = WebSocket(url: URL(string: "ws://goosc.herokuapp.com/ws?useremail=\(Auth().email)&destemail=admin@goosc.com&username=\(Auth().firstName)&type=admin")!, protocols: ["chat"])
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatWireFrame.createChatModule(self)
        socket.delegate = self
        socket.connect()
        presenter?.viewDidLoad()
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
        for item in resp.data {
            messages.append(item)
        }
        collectionView.reloadData()
        collectionView.scrollToBottom(animated: false)
    }
    
    override func inputViewPrimaryActionTriggered(inputView: MSGInputView) {
        let newMsg = Chat.Detail(chatId: "", userEmail: Auth().email, username: Auth().firstName, destinationEmail: "", destinationName: "", message: inputView.message, read: false, typeChat: "chat", chatDate: "")
        messages.append(newMsg)
        collectionView.reloadData()
        let jsonObject: [String: String] = ["Message": inputView.message]
        let stringify = JsonManipulate().JSONStringify(value: jsonObject)
        socket.write(string: stringify)
        collectionView.scrollToBottom(animated: false)
    }
}

extension ChatView:WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }

    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(error?.localizedDescription ?? "")")
    }

    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        do {
            let jsonDecode = try JSONDecoder().decode(Chat.MessageDetail.self, from: text.data(using: .utf8)!)
            let newMsg = Chat.Detail(chatId: "", userEmail: "admin@goosc.com", username: jsonDecode.from, destinationEmail: "", destinationName: "", message: jsonDecode.message, read: false, typeChat: jsonDecode.type, chatDate: "")
            messages.append(newMsg)
            collectionView.reloadData()
            collectionView.scrollToBottom(animated: true)
        } catch {
            print("message can not be decoded")
        }
    }

    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("ambil data eoi")
    }
}

extension ChatView: MSGDataSource {
    func message(for indexPath: IndexPath) -> MSGMessage {
        let messageData = messages[indexPath.item]
        var isSender = true
        if Auth().email == messageData.userEmail {
            isSender = false
        }
        
        let sender = Chat.Sender(displayName: messageData.username, avatar: nil, isSender: isSender)
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
        return messages.count
    }
    
    func footerTitle(for section: Int) -> String? {
        return "Just now"
    }
    
    func headerTitle(for section: Int) -> String? {
        return messages[section].username
    }
}
