//
//  CartWireframe.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class  CartWireFrame: CartWireFrameProtocol {
    class func createCartModule(_ cartRef: CartView) {
        let presenter: CartPresenterProtocol & CartOutputInteractorProtocol = CartPresenter()
        cartRef.presenter = presenter
        cartRef.presenter?.wireFrame = CartWireFrame()
        cartRef.presenter?.view = cartRef
        cartRef.presenter?.interactor = CartInteractor()
        cartRef.presenter?.interactor?.presenter = presenter
    }
    
    func routeToSignIn(from view: UIViewController) {
        let signInPage = view.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! Login
        LoginWireframe.createLoginModule(signInPage)
        view.present(signInPage, animated: true, completion: nil)
    }
}
