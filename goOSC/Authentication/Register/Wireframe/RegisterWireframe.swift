//
//  LoginWireframe.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//


import UIKit

class RegisterWireframe: RegisterRouterProtocol {
    
    func pushToLogin(with identifier: String, from view: UIViewController) {
        view.dismiss(animated: true, completion: nil)
    }
    
    static func createRegisterModule(registerViewRef: RegisterView) {
        let presenter: RegisterPresenterProtocol = RegisterPresenter()
        
        registerViewRef.presenter = presenter
        registerViewRef.presenter?.wireframe = RegisterWireframe()
        registerViewRef.presenter?.view = registerViewRef
        registerViewRef.presenter?.interactor = RegisterInteractor()
        registerViewRef.presenter?.interactor?.presenter = presenter
    }
}
