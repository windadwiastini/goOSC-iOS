//
//  LoginPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class RegisterPresenter: RegisterPresenterProtocol {
    
    var interactor: RegisterInteractorProtocol?
    var view: RegisterViewProtocol?
    var wireframe: RegisterRouterProtocol?
    
    func verifyInput(email: String, password: String, repeatPassword: String, firstName: String, lastName: String) {
        interactor?.verifyInput(email: email, password: password, repeatPassword: repeatPassword, firstName: firstName, lastName: lastName, handler: { (verified, user) in
            if verified {
                let registrationEndpoint = "\(Config().url)/registration"
                self.interactor?.sendRegistrationRequest(endpoint: registrationEndpoint, user: user!, handler: { (success, error, message) in
                    if success {
                        print("Success send registration")
                        self.view?.lauchAlert("Registration Success", "You have successfully registered! Please login to continue.", true)
//                        self.view?.showLoginView()
                    } else {
                        print("Failed send registration")
                        self.view?.lauchAlert("Registration Failed", "Registration failed. \(message)", false)
//                        self.view?.showLoginView()
                    }
                })
            } else {
                self.view?.lauchAlert("Can't Register", "Please make sure all field is not empty & the password field match.", false)
            }
        })
    }
    
    func showLoginView(from view: UIViewController) {
        print("show login in presenter")
        wireframe?.pushToLogin(with: "LoginView", from: view)
    }
}
