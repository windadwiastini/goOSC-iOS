//
//  Login.swift
//  goOSC
//
//  Created by Bootcamp on 28/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class Login: UIViewController, LoginViewProtocol {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginWireframe.createLoginModule(self)
        presenter?.viewDidLoad()
    }
    
    @IBAction func redirectToForgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func loginWithTwitterBtnWasPressed(_ sender: Any) {
        presenter?.loginWithSocialMedia(type: "twitter")
    }
    
    @IBAction func loginWithGoogleBtnWasPressed(_ sender: Any) {
        presenter?.loginWithSocialMedia(type: "google")
    }
    
    @IBAction func loginWithFacebookBtnWasPressed(_ sender: Any) {
        presenter?.loginWithSocialMedia(type: "facebook")
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        let username = usernameField.text
        let pasword = passwordField.text
        let user = Customer.Request(name: "", email: username!, password: pasword!)
        print("login clicked")
        presenter?.interactor?.doLogin(user)
    }
    
    func openAlert(_ title: String, _ context: String) {
        let alert = UIAlertController(title: title, message: context, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {resp in
            if UserDefaults.standard.bool(forKey: "loggedIn") {
                self.presenter?.wireFrame?.routeToRegister(from: self)
            }
        }))
        present(alert, animated: true)
    }
    
    
}
