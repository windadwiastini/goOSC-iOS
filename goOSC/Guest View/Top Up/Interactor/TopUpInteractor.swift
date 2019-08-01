//
//  TopUpInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 24/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
class TopUpInteractor: TopUpInputInteractorProtocol {
    var presenter: TopUpOutputInteractorProtocol?
    let token = Auth().token
    func getTopUpAmount() {
        let url = "\(Config().url)/dashboard/user/topupammount"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print(response)
            switch response.response?.statusCode {
            case 500?:
                print("error")
            case 401?:
                self.presenter?.signout()
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(TopUp.ResponseAmount.self, from: response.data!)
                self.presenter?.responseAmount(jsonDecode)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
    func submitTopup(ammount: Double, file image: UIImage) {
        presenter?.showLoading()
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        let image2 = UIImageJPEGRepresentation(image, 0.2)
        let parameter = ["ammount": String(ammount)]
        let url = "\(Config().url)/dashboard/user/topuporder"
        Alamofire.upload(multipartFormData: {multipartFormData in
            multipartFormData.append(image2!, withName: "receipt", fileName: "evidence.jpg", mimeType: "image/jpg")
                            for (key, value) in parameter {
                                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                            }
        }, to: url, headers: header) {result in
            switch result {
            case .success (let upload, _, _):
                upload.uploadProgress(closure:{(progress) in
                    if progress.isFinished {
                        self.presenter?.hideLoading()
                    }
                })
                
                upload.responseJSON {response in
                    switch response.response?.statusCode {
                    case 500?:
                        print("error")
                    case 401?:
                        self.presenter?.signout()
                    case 200?:
                        let jsonDecode = try! JSONDecoder().decode(TopUp.ResponseAmount.self, from: response.data!)
                        self.presenter?.showAlert(jsonDecode)
                    case .none:
                        print("error")
                    case .some(_):
                        print("error")
                    }
                }
            case .failure(_):
                print(EncodingError.self)
            }
        }
    }
    
    func getUserDashboardData() {
        let url = "\(Config().url)/dashboard/user"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print(response)
            switch response.response?.statusCode {
            case 500?:
                print("error")
            case 401?:
                self.presenter?.signout()
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(TopUp.UserDashboard.self, from: response.data!)
                self.presenter?.applyUserDashboardData(jsonDecode.data[0])
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
}
