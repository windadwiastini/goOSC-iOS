//
//  ForgotPasswordProtocols.swift
//  goOSC
//
//  Created by Bootcamp on 03/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol ForgotPasswordViewProtocol {
    func dissmiss()
}

protocol ForgotPasswordPresenterProtocol: AnyObject {
    var view: ForgotPasswordViewProtocol? {get set}
    var wireFrame: ForgotPasswordWireFrameProtocol? {get set}
    var interactor: ForgotPasswordInputInteractorProtocol? {get set}
    func viewDidLoad()
    
}

protocol ForgotPasswordWireFrameProtocol: AnyObject {}

protocol ForgotPasswordInputInteractorProtocol: AnyObject {
    var presenter: ForgotPasswordOutPutInteractorProtocol? {get set}
    
    func doForgotPassword(_ req: ForgotPassword.Request)
}

protocol ForgotPasswordOutPutInteractorProtocol: AnyObject {
    func response(_ response: ForgotPassword.Response)
}
