//
//  BalanceHistoryInspectore.swift
//  goOSC
//
//  Created by Bootcamp on 28/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
class BalanceHistoryInspector: BalanceHistoryInputInteractorProtocol{
    var presenter: BalanceHistoryOutputInteractorProtocol?
    let token = UserDefaults.standard.value(forKey: "token")!
    func findAllBalance() {
        let url = "\(Config().url)/dashboard/user/balancehistory"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                print("error")
            case 401?:
                self.presenter?.signout()
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(BalancdHistory.Response.self, from: response.data!)
                self.presenter?.response(response: jsonDecode)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
    
    
}
