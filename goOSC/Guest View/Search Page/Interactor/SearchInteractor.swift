//
//  SearchInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 6/12/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire

class SearchInteractor: SearchInputInteractorProtocol {
    var presenter: SearchOutputInteractorProtocol?
    
    func sendGetProductRequest(with keyword: String) {
        var newKeyword = keyword
        if keyword.contains(" ") {
            newKeyword = keyword.replacingOccurrences(of: " ", with: "%20")
        }
        
        let url = "\(Config().url)/guest/product/search?q=\(newKeyword)"
        print(url)
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let resp = HomePage.Response(code: 500, message: "Internal server error", data: [], length: 0)
                self.presenter?.response(resp)
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(HomePage.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode)
            case .none:
                let resp = HomePage.Response(code: 401, message: "Not Found", data: [], length: 0)
                self.presenter?.response(resp)
            case .some(_):
                let resp = HomePage.Response(code: 401, message: "Some error occured", data: [], length: 0)
                self.presenter?.response(resp)
            }
        }
    }
    
    
}
