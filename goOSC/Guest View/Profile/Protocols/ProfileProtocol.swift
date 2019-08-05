//
//  ProfileProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol ProfileViewProtocol: class {
    func updateView(response resp: Profile.Response)
}

protocol ProfilePresenterProtocol: class {
    var wireFrame : ProfileWireFrameProtocol? {get set}
    var view: ProfileViewProtocol? {get set}
    var interactor: ProfileInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol ProfileWireFrameProtocol: class {
}

protocol ProfileInputInteractorProtocol: class {
    var presenter : ProfileOutputInteractorProtocol? {get set}
    func getUserDetail()
}

protocol ProfileOutputInteractorProtocol: class {
    func responSuccess(response resp: Profile.Response)
    func responseFail(response resp: Profile.ResponseFail)
}
