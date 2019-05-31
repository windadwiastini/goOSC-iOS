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
        print("go to home page")
        let registerController = view.storyboard?.instantiateViewController(withIdentifier: "HomePage") as! HomePageView
        HomePageWireFrame.createHomePageModule(registerController)
        view.present(registerController , animated: true, completion: nil)
//        view.navigationController?.pushViewController(registerController, animated: true)
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
