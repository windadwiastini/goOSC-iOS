//
//  ChatProtocol.swift
//  goOSC
//
//  Created by Bootcamp on 6/14/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

protocol ChatViewProtocol {
    
}

protocol ChatInputInteractorProtocol {
    var presenter: ChatOutputInteractorProtocol? { get set }
}

protocol ChatOutputInteractorProtocol {
    
}

protocol ChatPresenterProtocol {
    var wireFrame : ChatWireFrameProtocol? {get set}
    var view: ChatViewProtocol? {get set}
    var interactor: ChatInputInteractorProtocol? {get set}
    func viewDidLoad()
}

protocol ChatWireFrameProtocol {
    func routeToSignIn(from view: UIViewController)
    
}
