//
//  LoginWireframe.swift
//  goOSC
//
//  Created by Bootcamp on 29/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Alamofire

class LoginWireframe: LoginWireFrameProtocol {
    func routeToRegister(from view: UIViewController) {
        let registerController = view.storyboard?.instantiateViewController(withIdentifier: "RegisterSotyboard") as! RegisterView
    }
    
    class func createLoginModule(_ loginRef: Login) {
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenter()
        loginRef.presenter = presenter
        loginRef.presenter?.wireFrame = LoginWireframe()
        loginRef.presenter?.view = loginRef
        loginRef.presenter?.interactor = LoginInteractor()
        loginRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
