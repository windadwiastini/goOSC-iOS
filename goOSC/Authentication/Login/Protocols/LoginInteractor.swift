//
//  LoginInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 29/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire

class LoginInteractor: LoginInputInteractorProtocol {
    var presenter: LoginOutputInteractorProtocol?
    
    func doLogin(_ customer: Customer.Request) {
        let parameters: [String: String] = [
            "email" : customer.email,
            "password" : customer.password
        ]
        Alamofire.request("\(Config().url)/auth", method: .post, parameters: parameters, encoding: JSONEncoding.default ).responseJSON {response in
            print(response.response?.statusCode)
            switch response.response?.statusCode {
            case 401?:
                let resp = Customer.Response(code: 401, message: "Email or password is not valid", data: nil)
                self.presenter?.response(resp)
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(Customer.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode)
                
            case .none:
                let resp = Customer.Response(code: 401, message: "Email or password is not valid", data: nil)
                self.presenter?.response(resp)
            case .some(_):
                let resp = Customer.Response(code: 401, message: "Email or password is not valid", data: nil)
                self.presenter?.response(resp)
            }
        }
    }
}
