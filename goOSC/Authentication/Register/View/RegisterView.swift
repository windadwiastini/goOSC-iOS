//
//  LoginView.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import ReactiveKit
class RegisterView: UIViewController, RegisterViewProtocol, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    var presenter: RegisterPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterWireframe.createRegisterModule(registerViewRef: self)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        configureRegister()
    }
    
    fileprivate func configureRegister() {
        btnRegister.isEnabled = false
        combineLatest(emailTextField.reactive.text,passwordTextField.reactive.text, repeatPasswordTextField.reactive.text, firstNameTextField.reactive.text, lastNameTextField.reactive.text) { email, password, repeatPassword, firstName, lastNAme in
            if let email = email, let password = password, let repeatPassword = repeatPassword, let firstName = firstName, let lastNAme = lastNAme {
             return email.count > 0 && password.count > 0 && repeatPassword.count > 0 && firstName.count > 0 && lastNAme.count > 0 && password == repeatPassword
            }
            return false
        }.bind(to: btnRegister.reactive.isEnabled)
        
        btnRegister.reactive.controlEvents(.touchUpInside).observeNext { e in
            guard let email = self.emailTextField.text, let password = self.passwordTextField.text, let repeatPassword = self.repeatPasswordTextField.text, let firstName = self.firstNameTextField.text, let lastName = self.lastNameTextField.text else {
                return
            }
            self.presenter?.verifyInput(email: email, password: password, repeatPassword: repeatPassword, firstName: firstName, lastName: lastName)
        }
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func lauchAlert(_ title: String, _ context: String, _ withClosure: Bool ) {
        if withClosure {
            Alert().alertWithClosure(title: title, message: context, ui: self)
        } else {
            Alert().informationAlert(title: title, message: context, ui: self)
        }
        
    }
    
    func showLoginView() {
        presenter?.showLoginView(from: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let newTag = textField.tag + 1
        
        if let next = view.viewWithTag(newTag) {
            next.becomeFirstResponder()
        } else {
            if let email = emailTextField.text, let password = passwordTextField.text, let repeatPassword = repeatPasswordTextField.text, let firstName = firstNameTextField.text, let lastNAme = lastNameTextField.text {
             presenter?.verifyInput(email: email, password: password, repeatPassword: repeatPassword, firstName: firstName, lastName: lastNAme)
            }
        }
        return true
    }
}


