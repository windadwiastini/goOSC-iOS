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
     let token = Auth().token
    func doPaymentWithPayPal() {
        let url = "\(Config().url)/cart/dopayment"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        let parameters:[String: String] = [
            "token" : token,
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
                    case 200?:
                        do {
                            if let dataresponse = response.data {
                                let jsonDecode = try JSONDecoder().decode(PaypalEntity.Response.self, from: dataresponse)
                                self.presenter?.responsePaymentWithPayPal(jsonDecode)
                            }
                        } catch {
                            print("the response can not decoded")
                        }
                    case .none, .some(_):
                        print("error")
                    }
                }
            case .failure(_):
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
        for item in ref.data.paymentData.productList {
            let a = ["id": item.id, "product_id": item.productID, "product_name" : item.productName, "price" : "\(item.price)", "cprovider_email": item.cproviderEmail, "thumbnail": item.thumbnail]
            arr.append(a)
        }

        let parameters:[String: Any] = [
            "voucher": ref.data.paymentData.voucher,
            "total": "\(ref.data.paymentData.total)",
            "total_discount": "\(ref.data.paymentData.totalDiscount)",
            "final_price": "\(ref.data.paymentData.finalPrice)",
            "currency": ref.data.paymentData.currency,
            "product_list": arr
            ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 200?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(PaypalEntity.ResponseDoPayment.self, from: dataResponse)
                        self.presenter?.responseDoPaymentPaypal(jsonDecode)
                    }
                } catch {
                    print("the response can not decoded")
                }
            case 500?, .none, .some(_):
                print("error")
            }
        }
    }
    
}
