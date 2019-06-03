//
//  ForgotPasswordWireFrame.swift
//  goOSC
//
//  Created by Bootcamp on 03/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class ForgotPasswordWireFrame: ForgotPasswordWireFrameProtocol {
    
    class func createForgotPasswordModule(_ forgotPasswordRef: ForgotPasswordView) {
        let presenter: ForgotPasswordPresenterProtocol & ForgotPasswordOutPutInteractorProtocol = ForgotPasswordPresenter()
        forgotPasswordRef.presenter = presenter
        forgotPasswordRef.presenter?.wireFrame = ForgotPasswordWireFrame()
        forgotPasswordRef.presenter?.view = forgotPasswordRef
        forgotPasswordRef.presenter?.interactor = ForgotPasswordInteractor()
        forgotPasswordRef.presenter?.interactor?.presenter = presenter
    }
}
