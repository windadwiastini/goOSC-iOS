//
//  LoginProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 29/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol LoginViewProtocol {
    func openAlert(_ title: String, _ context: String)
}

protocol LoginPresenterProtocol {
    var wireFrame : LoginWireFrameProtocol? {get set}
    var view: LoginViewProtocol? {get set}
    var interactor: LoginInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol LoginWireFrameProtocol {
    func routeToRegister(from view: UIViewController )
}

protocol LoginInputInteractorProtocol {
    var presenter : LoginOutputInteractorProtocol? {get set}
    func doLogin(_ customer: Customer.Request)
}

protocol LoginOutputInteractorProtocol {
    func response(_ resp: Customer.Response )
}
