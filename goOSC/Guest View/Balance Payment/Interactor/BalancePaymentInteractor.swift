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
        let vch = UserDefaults.standard.value(forKey: "vch") ?? ""
        let url = "\(Config().url)/cart/summary?payment=balance&voucher=\(vch)"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(BalancePayment.FailedResponse.self, from: dataResponse)
                        self.presenter?.errorAlert(jsonDecode)
                    }
                } catch {
                    print("the response can not be decoded")
                }
                
            case 401?:
                self.presenter?.signout()
            case 200?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(BalancePayment.Response.self, from: dataResponse)
                        self.presenter?.response(jsonDecode)
                    }
                } catch {
                    print("the response can not be decoded")
                }
            case .none, .some(_):
                print("error")
            }
        }
    }
    
    func doPaymentBalance() {
        let voucher:String
        if let vch =  UserDefaults.standard.value(forKey: "vch") as? String { voucher = vch } else { voucher = "" }
        let url = "\(Config().url)/cart/dopayment"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        let parameters:[String: String] = [
            "token" : token ,
            "payment_type": "balance",
            "voucher": voucher
        ]
        Alamofire.upload(multipartFormData: {multipartFormData in
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        }, to: url, headers: header) {result in
            switch result {
            case .success (let upload, _, _):
                upload.responseJSON {response in
                    switch response.response?.statusCode {
                    case 500?:
                        do {
                            if let dataResponse = response.data {
                                let jsonDecode = try JSONDecoder().decode(BalancePayment.FailedResponse.self, from: dataResponse)
                                self.presenter?.errorAlert(jsonDecode)
                            }
                        } catch {
                            print("the response can not be decoded")
                        }
                    case 401?:
                        self.presenter?.signout()
                    case 200?:
                        do {
                            if let dataResponse = response.data {
                                UserDefaults.standard.removeObject(forKey: "vch")
                                let jsonDecode = try JSONDecoder().decode(BalancePayment.PaymentResponse.self, from: dataResponse)
                                self.presenter?.responseSuccessAlert(paymentResponse: jsonDecode)
                            }
                        } catch {
                            print("the response can cot be decoded")
                        }
                    case .none, .some(_):
                        print("error")
                    }
                }
            case .failure( _):
                print(EncodingError.self)
            }
        }
    }
    
}
