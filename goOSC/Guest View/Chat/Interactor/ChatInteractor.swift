//
//  ChatInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
class ChatInteractor: ChatInputInteractorProtocol {
    var presenter: ChatOutputInteractorProtocol?
    func detailChat(from userEmail: String, to destinationEmail: String) {
        let url = "\(Config().url)/chat"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(Auth().token)",
            "Content-Type": "application/json"
        ]
        
        let parameter: [String: String] = [
            "useremail" : userEmail,
            "destination_email" : destinationEmail
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header ).responseJSON {response in
            print(response)
            switch response.response?.statusCode {
            case 200?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(Chat.ResponseDetail.self, from: dataResponse)
                        self.presenter?.responseDetailChat(response: jsonDecode)
                    }
                } catch {
                        print("the response can not be decoded")
                }
            case 500?, 401?, .none, .some(_):
                print("error")
            }
        }
    }
}
