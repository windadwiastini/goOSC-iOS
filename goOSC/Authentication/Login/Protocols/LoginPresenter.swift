//
//  LoginPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 29/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    var wireFrame: LoginWireFrameProtocol?
    var view: LoginViewProtocol?
    var interactor: LoginInputInteractorProtocol?
    var presenter: LoginPresenterProtocol?
    func viewDidLoad() {
    }
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func response(_ resp: Customer.Response ) {
        view?.openAlert("Login", resp.message)
        wireFrame?.routeToRegister(from: view as! UIViewController)
    }
}
