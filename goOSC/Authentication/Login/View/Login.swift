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
    
    @IBAction func loginWithSosMed(_ sender: Any) {
    }
    
    @IBAction func moveToRegister(_ sender: Any) {
        presenter?.wireFrame?.routeToRegister(from: self)
    }
    
    @IBAction func doLogin(_ sender: Any) {
        let username = usernameField.text
        let pasword = passwordField.text
        let user = Customer(name: "", email: username!, password: pasword!)
        print("login clicked")
        presenter?.interactor?.doLogin(user)
    }
    
    func openAlert(_ title: String, _ context: String) {
        print("alertnyaa")
        Alert().informationAlert(title: title, message: context, ui: self)
    }
}
