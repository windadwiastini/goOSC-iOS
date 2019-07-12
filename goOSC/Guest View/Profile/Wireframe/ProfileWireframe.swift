//
//  ProfileWireframe.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class ProfileWireframe: ProfileWireFrameProtocol {
    class func createProfileModule(_ ref: ProfileView) {
        let presenter: ProfilePresenterProtocol & ProfileOutputInteractorProtocol = ProfilePresenter()
        ref.presenter = presenter
        ref.presenter?.wireFrame = ProfileWireframe()
        ref.presenter?.view = ref
        ref.presenter?.interactor = ProfileInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
}
