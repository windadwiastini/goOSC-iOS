//
//  DetailPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class DetailPresenter: DetailPresenterProtocol {
    var product: HomePage.Product?
    
    var wireFrame: DetailWireFrameProtocol?
    var view: DetailViewProtocol?
    var interactor: DetailInputInteractorProtocol?
    
    func viewDidLoad() {
        if product != nil {
            interactor?.findDetail(product!, false)
        }
    }
    
    
}

extension DetailPresenter: DetailOutputInteractorProtocol {
    func response(_ data: Detail.Response,  _ updateLike: Bool) {
        switch data.code {
        case 200:
            if updateLike {
                view?.updateLike(data.data!)
            } else {
                view?.showItem(data.data!)
            }
        default:
            Alert().informationAlert(title: "Fetch Detail", message: data.message, ui: view as! UIViewController)
        }
    }
}