//
//  ForgotPasswordPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 03/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class ForgotPasswordPresenter: ForgotPasswordPresenterProtocol {
    var view: ForgotPasswordViewProtocol?
    
    var wireFrame: ForgotPasswordWireFrameProtocol?
    
    var interactor: ForgotPasswordInputInteractorProtocol?
    
    func viewDidLoad() {}
    
}

extension ForgotPasswordPresenter: ForgotPasswordOutPutInteractorProtocol {
    func response(_ response: ForgotPassword.Response) {
        let alert = UIAlertController(title: "Forgot Password", message: response.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {resp in
            switch response.code {
                case 200:
                    self.view?.dissmiss()
            default:
                print(response.code)
            }
        }))
        
        guard let viewComponent = view as? UIViewController else {return}
        viewComponent.present(alert, animated: true)
    }
}
