//
//  HomePageView.swift
//  goOSC
//
//  Created by Bootcamp on 31/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit
class HomePageView: UIViewController, HomePageViewProtocol {
    var presenter: HomePagePresenterProtocol?
    fileprivate var homePageData = Observable<HomePage.Response>(HomePage.Response(code: 0, message: "", data: [], length: 0))
    
    fileprivate var data = MutableObservableArray([HomePage.Product]())
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        HomePageWireFrame.createHomePageModule(self)
        presenter?.viewDidLoad()
        observeFunction()
    }
    
    func updateData(response: HomePage.Response) {
        homePageData.value = response
    }
    
    fileprivate func observeFunction() {
        signBtn.reactive.controlEvents(.touchUpInside).observeNext{ e in
            SignOut().hitSignOutButton(view: self)
        }.dispose(in: bag)
        homePageData.observeNext { value in
            self.data.removeAll()
            value.data.map{ e in
                if let element = e {
                 self.data.append(element)
                }
            }
        }.dispose(in: bag)
        
        data.bind(to: tableView, animated: true) {dataSource, indexPath, tableView in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "homePageCell") as? HomePageCell else { return UITableViewCell() }
            let data = dataSource[indexPath.row]
            cell.configureCell(data: data)
            return cell
        }.dispose(in: bag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        bag.dispose()
    }
}
extension HomePageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.wireFrame?.routeToDetail(from: self, with: data[indexPath.row])
    }
}
