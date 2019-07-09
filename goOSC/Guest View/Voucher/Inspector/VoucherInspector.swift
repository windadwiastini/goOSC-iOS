//
//  VoucherInspector.swift
//  goOSC
//
//  Created by Bootcamp on 09/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Alamofire
class VoucherInteractor: VoucherInputInteractorProtocol {
    var presenter: VoucherOutputInteractorProtocol?
    let token = UserDefaults.standard.value(forKey: "token")!
    func validateVoucher(voucher data: String) {
        print("do validate")
        let url = "\(Config().url)/cart/voucher?voucher=\(data)"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let jsonDecode = try! JSONDecoder().decode(VoucherEntity.ResponseFailed.self, from: response.data!)
                self.presenter?.responseFail(response: jsonDecode)
            case 401?:
                print("error")
//                self.presenter?.signout()
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(VoucherEntity.ResponseSuccess.self, from: response.data!)
                UserDefaults.standard.set(jsonDecode.data.voucher, forKey: "vch")
                self.presenter?.responSuccess(response: jsonDecode)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
    
}
