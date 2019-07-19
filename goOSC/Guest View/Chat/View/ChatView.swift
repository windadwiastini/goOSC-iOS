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

    var presenter: CartPresenterProtocol?
    
    @IBOutlet weak var msgTextField: UITextField!
    
    fileprivate var socket = WebSocket(url: URL(string: "ws://goosc.herokuapp.com/ws?useremail=renifal@gmail.com&destemail=admin@goosc.com&username=renikumalawati&type=admin")!, protocols: ["chat"])
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view chat did load")
        socket.delegate = self
        socket.connect()
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
        print(pesan)
        
        let jsonObject: [String: String] = ["Message": pesan]
        let stringify = JsonManipulate().JSONStringify(value: jsonObject)
        print(stringify)
        socket.write(string: stringify)
        
    }
    
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        sendMessage()
    }
    
}

extension ChatView:WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
        sendMessage()
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("got some text: \(text)")    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("got some data: \(data.count)")
    }
}
