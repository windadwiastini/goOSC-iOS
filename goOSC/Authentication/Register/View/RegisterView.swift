//
//  LoginView.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class RegisterView: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var presenter: RegisterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterWireframe.createRegisterModule(registerViewRef: self)
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtnWasPressed(_ sender: Any) {
        presenter?.verifyInput(email: emailTextField.text!, password: passwordTextField.text!, repeatPassword: repeatPasswordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
        
    }
}

