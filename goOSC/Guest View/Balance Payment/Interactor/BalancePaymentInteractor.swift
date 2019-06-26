//
//  BalancePaymentInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
class BalancePaymentInteractor: BalancePaymentInputInteractorProtocol {
    var presenter: BalancePaymentOutputInteractorProtocol?
    let token = UserDefaults.standard.value(forKey: "token")!
    
    func summary() {
         print("summary state")
        let url = "\(Config().url)/cart/summary?payment=balance"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print(response)
            switch response.response?.statusCode {
            case 500?:
                let jsonDecode = try! JSONDecoder().decode(BalancePayment.FailedResponse.self, from: response.data!)
                self.presenter?.errorAlert(jsonDecode)
            case 200?:
//                let jsonDecode = try! JSONDecoder().decode(CartEntity.Response.self, from: response.data!)
//                self.presenter?.response(jsonDecode)
                print(response)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
    
}
