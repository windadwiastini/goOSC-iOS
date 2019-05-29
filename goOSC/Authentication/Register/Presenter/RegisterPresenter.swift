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
    let url = "https://goosc.herokuapp.com/"
    
    func verifyInput(email: String, password: String, repeatPassword: String, firstName: String, lastName: String) {
        interactor?.verifyInput(email: email, password: password, repeatPassword: repeatPassword, firstName: firstName, lastName: lastName, handler: { (verified, user) in
            if verified {
                let registrationEndpoint = self.url + "registration"
                self.interactor?.sendRegistrationRequest(endpoint: registrationEndpoint, user: user!)
            } else {
                
            }
        })
    }
    
    
    
}
