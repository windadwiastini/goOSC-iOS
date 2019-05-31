//
//  HomePageView.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class HomePageView: UIViewController, HomePageViewProtocol {
    var presenter: HomePagePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomePageWireFrame.createHomePageModule(self)
        presenter?.viewDidLoad()
        print("Homepage loaded")
    }
}
