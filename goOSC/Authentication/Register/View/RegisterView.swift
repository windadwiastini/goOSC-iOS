//
//  LoginView.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class RegisterView: UIViewController, RegisterViewProtocol, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var presenter: RegisterPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterWireframe.createRegisterModule(registerViewRef: self)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerBtnWasPressed(_ sender: Any) {
        presenter?.verifyInput(email: emailTextField.text!, password: passwordTextField.text!, repeatPassword: repeatPasswordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
    }
    
    func lauchAlert(_ title: String, _ context: String, _ withClosure: Bool ) {
        if withClosure {
            Alert().alertWithClosure(title: title, message: context, ui: self)
        } else {
            Alert().informationAlert(title: title, message: context, ui: self)
        }
        
    }
    
    func showLoginView() {
        print("show login in view")
        presenter?.showLoginView(from: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let newTag = textField.tag + 1
        
        if let next = view.viewWithTag(newTag) {
            next.becomeFirstResponder()
        } else {
            presenter?.verifyInput(email: emailTextField.text!, password: passwordTextField.text!, repeatPassword: repeatPasswordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
        }
        return true
    }
}


