//
//  ChatView.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class ChatView: UIViewController, ChatViewProtocol {

    var presenter: CartPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func doSignOut(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        presenter?.wireFrame?.routeToSignIn(from: self)
    }
    
}
