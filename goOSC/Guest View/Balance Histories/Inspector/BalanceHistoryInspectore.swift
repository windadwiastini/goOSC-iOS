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
    let token = Auth().token
    func findAllBalance() {
        let url = "\(Config().url)/dashboard/user/balancehistory"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 401?:
                self.presenter?.signout()
            case 200?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(BalancdHistory.Response.self, from: dataResponse)
                        self.presenter?.response(response: jsonDecode)
                    }
                } catch {
                    print("the response can not be decoded")
                }
            case 500?, .none, .some(_):
                print("error")
            }
        }
    }
    
    
}
