//
//  LoginProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 29/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func openAlert(_ title: String, _ context: String)
    func loadWeb(_ url: URL)
}

protocol LoginPresenterProtocol: AnyObject {
    var wireFrame : LoginWireFrameProtocol? {get set}
    var view: LoginViewProtocol? {get set}
    var interactor: LoginInputInteractorProtocol? {get set}
    func viewDidLoad()
    func loginWithSocialMedia(type: String)
    func showWebViews(_ web: URL)
}

protocol LoginWireFrameProtocol: AnyObject {
    func routeToHomePage(from view: UIViewController )
}

protocol LoginInputInteractorProtocol: AnyObject {
    var presenter : LoginOutputInteractorProtocol? {get set}
    func doLogin(_ customer: Customer.Request)
    func loginWithSocialMedia(type: String)
}

protocol LoginOutputInteractorProtocol: AnyObject {
    func response(_ resp: Customer.Response )
    func showWebView(_ url: URL)
}
