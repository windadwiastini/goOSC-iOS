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
//        let loginView = view.storyboard?.instantiateViewController(withIdentifier: identifier) as! Login
//        RegisterWireframe
    }
    
    static func createRegisterModule(registerViewRef: RegisterView) {
        let presenter: RegisterPresenterProtocol = RegisterPresenter()
        
        registerViewRef.presenter = presenter
        registerViewRef.presenter?.wireframe = RegisterWireframe()
        registerViewRef.presenter?.interactor = RegisterInteractor()
        registerViewRef.presenter?.interactor?.presenter = presenter
    }
}
