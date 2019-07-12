//
//  ProfileProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol ProfileViewProtocol {
    func updateView(response resp: Profile.Response)
    func signOut()
}

protocol ProfilePresenterProtocol {
    var wireFrame : ProfileWireFrameProtocol? {get set}
    var view: ProfileViewProtocol? {get set}
    var interactor: ProfileInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol ProfileWireFrameProtocol {
}

protocol ProfileInputInteractorProtocol {
    var presenter : ProfileOutputInteractorProtocol? {get set}
    func getUserDetail()
}

protocol ProfileOutputInteractorProtocol {
    func responSuccess(response resp: Profile.Response)
    func responseFail(response resp: Profile.ResponseFail)
}