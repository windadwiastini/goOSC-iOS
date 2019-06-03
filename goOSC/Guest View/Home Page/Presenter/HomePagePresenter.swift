//
//  HomePagePresenter.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class HomePagePresenter: HomePagePresenterProtocol {
    
    var wireFrame: HomePageWireFrameProtocol?
    var view: HomePageViewProtocol?
    var interactor: HomePageInputInteractorProtocol?
    var presenter: HomePagePresenterProtocol?
    
    func viewDidLoad() {
        interactor?.sendHomePageRequest()
    }
}

extension HomePagePresenter: HomePageOutputInteractorProtocol {
    func response(_ response: HomePage.Response) {
        view?.updateData(response: response)
    }
    
    
}
