//
//  RegisterProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol RegisterViewProtocol: class {
    
}

protocol RegisterPresenterProtocol: class {
    var interactor: RegisterInteractorProtocol? { get set }
    var view: RegisterViewProtocol? { get set }
    var wireframe: RegisterRouterProtocol? { get set }
    
    func verifyInput(email: String, password: String, repeatPassword: String, firstName: String, lastName: String)
}

protocol RegisterInteractorProtocol: class {
    var presenter: RegisterPresenterProtocol? { get set }
    
    func checkPassword(password: String, repeatPassword: String) -> Bool
    func verifyInput(email: String, password: String, repeatPassword: String, firstName: String, lastName: String, handler: @escaping (_ complete: Bool, _ user: UserData?) -> ())
    func sendRegistrationRequest(endpoint: String, user: UserData)
}

protocol RegisterRouterProtocol: class {
    func pushToLogin(with identifier: String, from view: UIViewController)
    static func createRegisterModule(registerViewRef: RegisterView)
}
