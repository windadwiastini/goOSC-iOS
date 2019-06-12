//
//  SearchPresenter.swift
//  goOSC
//
//  Created by Bootcamp on 6/12/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    var view: SearchViewProtocol?
    var interactor: SearchInputInteractorProtocol?
    var wireframe: SearchWireFrameProtocol?
    
    func viewDidLoad() {
        
    }    
}

extension SearchPresenter: SearchOutputInteractorProtocol {
    func response(_ response: HomePage.Response) {
        view?.updateData(response: response)
    }
}
