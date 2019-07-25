//
//  ChatView.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Starscream

class ChatView: UIViewController, ChatViewProtocol {
    var presenter: ChatPresenterProtocol?
    
    var dataSource = [Chat.Detail]()
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    @IBOutlet weak var msgTextField: UITextField!

    fileprivate var socket = WebSocket(url: URL(string: "ws://goosc.herokuapp.com/ws?useremail=\(Auth().email)&destemail=admin@goosc.com&username=renikumalawati&type=admin")!, protocols: ["chat"])
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatWireFrame.createChatModule(self)
        socket.delegate = self
        socket.connect()
        collectionV.dataSource = self
        collectionV.delegate = self
        collectionV.register(Message.self, forCellWithReuseIdentifier: "chatCell")
        presenter?.viewDidLoad()
    }

    deinit {
        socket.disconnect(forceTimeout: 0)
        socket.delegate = nil
    }

    @IBAction func goToPreviousPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    fileprivate func sendMessage() {
        let pesan = msgTextField.text!
        let jsonObject: [String: String] = ["Message": pesan]
        let stringify = JsonManipulate().JSONStringify(value: jsonObject)
        let newMsg = Chat.Detail(chat_id: "", useremail: Auth().email, username: "", destination_email: "", destination_name: "", message: pesan, read: false, type_chat: "", chat_date: "")
        socket.write(string: stringify)
        msgTextField.text = ""
        dataSource.append(newMsg)
        collectionV.reloadData()
    }
    
    func updateMessage(response resp: Chat.ResponseDetail) {
        print(resp)
        dataSource = resp.data
        collectionV.reloadData()
    }

    @IBAction func sendButtonTapped(_ sender: Any) {
        sendMessage()
    }
    
    
}

extension ChatView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "chatCell", for: indexPath) as! Message
        cell.message = dataSource[indexPath.row]
        print("widthnyaaa: \(collectionV.frame.width)")
        return cell
    }
}
extension ChatView: UICollectionViewDelegate {
}

extension ChatView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: dataSource[indexPath.row].message).boundingRect(with: CGSize(width: collectionV.frame.width, height: 1000), options: option, attributes:[NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)], context: nil)
        return CGSize(width: collectionV.frame.width, height: estimatedFrame.height + 10)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
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
        
        dataSource.append(newMsg)
        collectionV.reloadData()
        print("got some text: \(jsonDecode.Type)")
    }

    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("ambil data eoi")
    }
}

