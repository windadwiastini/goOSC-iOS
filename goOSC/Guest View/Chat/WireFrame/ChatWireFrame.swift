//
//  ChatWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class ChatWireFrame: ChatWireFrameProtocol {
    func routeToSignIn(from view: UIViewController) {
        let signInPage = view.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! Login
        LoginWireframe.createLoginModule(signInPage)
        view.present(signInPage, animated: true, completion: nil)
    }
}
