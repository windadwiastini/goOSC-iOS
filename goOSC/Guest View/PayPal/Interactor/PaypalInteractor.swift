//
//  PaypalInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 16/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
class PaypalInteractor: PaypalInputInteractorProtocol {
    var presenter: PaypalOutputInteractorProtocol?
     let token = UserDefaults.standard.value(forKey: "token")!
    func doPaymentWithPayPal() {
        let url = "\(Config().url)/cart/dopayment"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        let parameters:[String: String] = [
            "token" : token as! String,
            "payment_type": "paypal",
            "voucher": ""
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
                        print(response)
//                        let jsonDecode = try! JSONDecoder().decode(BalancePayment.FailedResponse.self, from: response.data!)
//                        self.presenter?.responsePaymentWithPayPal()
                    case 401?:
                        print(response)
//                        self.presenter?.signout()
                    case 200?:
                        print(response.value)
//                        UserDefaults.standard.removeObject(forKey: "vch")
                        let jsonDecode = try! JSONDecoder().decode(PaypalEntity.Response.self, from: response.data!)
                        self.presenter?.responsePaymentWithPayPal(jsonDecode)
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
    
    func doPaymentPaypal(_ ref: PaypalEntity.Response) {
        let url = "\(Config().url)/cart/dopaypalpayment"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        var arr = [[String: Any]]()
        for item in ref.Data.payment_data.product_list {
            let a = ["id": item.id, "product_id": item.product_id, "product_name" : item.product_name, "price" : "\(item.price)", "cprovider_email": item.cprovider_email, "thumbnail": item.thumbnail]
            arr.append(a)
        }

        let parameters:[String: Any] = [
            "voucher": ref.Data.payment_data.voucher,
            "total": "\(ref.Data.payment_data.total)",
            "total_discount": "\(ref.Data.payment_data.total_discount)",
            "final_price": "\(ref.Data.payment_data.final_price)",
            "currency": ref.Data.payment_data.currency,
            "product_list": arr
            ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                print("error")
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(PaypalEntity.ResponseDoPayment.self, from: response.data!)
                self.presenter?.responseDoPaymentPaypal(jsonDecode)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
    
}
