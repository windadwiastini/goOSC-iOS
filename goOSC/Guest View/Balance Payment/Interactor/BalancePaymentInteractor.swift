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
    let token = Auth().token
    
    func summary() {
        var vch = UserDefaults.standard.value(forKey: "vch") ?? ""
        let url = "\(Config().url)/cart/summary?payment=balance&voucher=\(vch)"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let jsonDecode = try! JSONDecoder().decode(BalancePayment.FailedResponse.self, from: response.data!)
                self.presenter?.errorAlert(jsonDecode)
            case 401?:
                self.presenter?.signout()
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(BalancePayment.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
    
    func doPaymentBalance() {
        var vch = UserDefaults.standard.value(forKey: "vch") ?? ""
        let url = "\(Config().url)/cart/dopayment"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        let parameters:[String: String] = [
            "token" : token as! String,
            "payment_type": "balance",
            "voucher": vch as! String
        ]
        Alamofire.upload(multipartFormData: {multipartFormData in
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: url, headers: header) {result in
            print(result)
            switch result {
            case .success (let upload, _, _):
                upload.responseJSON {response in
                    switch response.response?.statusCode {
                    case 500?:
                        let jsonDecode = try! JSONDecoder().decode(BalancePayment.FailedResponse.self, from: response.data!)
                        self.presenter?.errorAlert(jsonDecode)
                    case 401?:
                        self.presenter?.signout()
                    case 200?:
                        UserDefaults.standard.removeObject(forKey: "vch")
                        let jsonDecode = try! JSONDecoder().decode(BalancePayment.PaymentResponse.self, from: response.data!)
                        self.presenter?.responseSuccessAlert(paymentResponse: jsonDecode)
                    case .none:
                        print("error")
                    case .some(_):
                        print("error")
                    }
                }
            case .failure(let encodingError):
                print(EncodingError.self)
            }
        }
    }
    
}
