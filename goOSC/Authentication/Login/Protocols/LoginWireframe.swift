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
    func routeToHomePage(from view: UIViewController) {
        guard let tabController = view.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UIViewController else {return}
        guard let homePageController = view.storyboard?.instantiateViewController(withIdentifier: "HomePage") as? HomePageView else {return}
        HomePageWireFrame.createHomePageModule(homePageController)
        view.present(tabController , animated: true, completion: nil)
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
