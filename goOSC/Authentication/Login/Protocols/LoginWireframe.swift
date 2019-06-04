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
        let tabController = view.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UIViewController
        let homePageController = view.storyboard?.instantiateViewController(withIdentifier: "HomePage") as! HomePageView
        HomePageWireFrame.createHomePageModule(homePageController)
        view.present(tabController , animated: true, completion: nil)
    }
    
    class func createLoginModule(_ loginRef: Login) {
        print("masuk createLoginModule")
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenter()
        loginRef.presenter = presenter
        loginRef.presenter?.wireFrame = LoginWireframe()
        loginRef.presenter?.view = loginRef
        loginRef.presenter?.interactor = LoginInteractor()
        loginRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
