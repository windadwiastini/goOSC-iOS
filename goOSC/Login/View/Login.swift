//
//  Login.swift
//  goOSC
//
//  Created by Bootcamp on 28/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class Login: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func redirectToForgotPassword(_ sender: Any) {
    }
    
    @IBAction func loginWithSosMed(_ sender: Any) {
    }
    
    @IBAction func moveToRegister(_ sender: Any) {
    }
    
    @IBAction func doLogin(_ sender: Any) {
        let username = usernameField.text
        let pasword = passwordField.text
        print(username)
        print(pasword)
    }
}
