//
//  ProfilePresenter.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class ProfilePresenter: ProfilePresenterProtocol {
    var wireFrame: ProfileWireFrameProtocol?
    
    var view: ProfileViewProtocol?
    
    var interactor: ProfileInputInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getUserDetail()
    }
}

extension ProfilePresenter: ProfileOutputInteractorProtocol {
    func responSuccess(response resp: Profile.Response) {
        view?.updateView(response: resp)
    }
    
    func responseFail(response resp: Profile.ResponseFail) {
        print(resp.message)
    }
    
    
}
