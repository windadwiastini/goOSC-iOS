//
//  ForgotPasswordInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 03/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Alamofire

class ForgotPasswordInteractor: ForgotPasswordInputInteractorProtocol {
    var presenter: ForgotPasswordOutPutInteractorProtocol?
    
    func doForgotPassword(_ req: ForgotPassword.Request) {
        let parameter: [String: String] = [
            "email" : req.email
        ]
        
        Alamofire.request("\(Config().url)/forgot_password", method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in
            let jsonDecode = try! JSONDecoder().decode(ForgotPassword.Response.self, from: response.data!)
            
            self.presenter?.response(jsonDecode)
        }
    }
}
