//
//  RegisterProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol RegisterViewProtocol {
    func lauchAlert(_ title: String, _ context: String, _ withClosure: Bool)
    func showLoginView()
}

protocol RegisterPresenterProtocol {
    var interactor: RegisterInteractorProtocol? { get set }
    var view: RegisterViewProtocol? { get set }
    var wireframe: RegisterRouterProtocol? { get set }
    
    func verifyInput(email: String, password: String, repeatPassword: String, firstName: String, lastName: String)
    func showLoginView(from view: UIViewController)
}

protocol RegisterInteractorProtocol {
    var presenter: RegisterPresenterProtocol? { get set }
    
    func checkPassword(password: String, repeatPassword: String) -> Bool
    func verifyInput(email: String, password: String, repeatPassword: String, firstName: String, lastName: String, handler: @escaping (_ complete: Bool, _ user: User.UserData?) -> ())
    func sendRegistrationRequest(endpoint: String, user: User.UserData, handler: @escaping (_ success: Bool, _ error: Error?, _ message: String) -> ())
}

protocol RegisterRouterProtocol {
    func pushToLogin(with identifier: String, from view: UIViewController)
    static func createRegisterModule(registerViewRef: RegisterView)
}
