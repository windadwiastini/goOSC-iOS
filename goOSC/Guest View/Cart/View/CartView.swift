//
//  CartView.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit
class CartView: UIViewController, CartViewProtocol {
    weak var presenter: CartPresenterProtocol?
    fileprivate var homePageData = MutableObservableArray([CartEntity.SingleCart]())
    fileprivate let bagData = DisposeBag()
    @IBOutlet weak var cartButton: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        CartWireFrame.createCartModule(self)
    }
    override func viewDidAppear(_ animated: Bool) {
        prepareObservable()
        presenter?.viewDidLoad()
        cartButton.isEnabled = false
    }
    func updateData(response: CartEntity.Response) {
        homePageData.removeAll()
        homePageData.replace(with: response.data)
    }
    @IBAction func doSignOut(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        presenter?.wireFrame?.routeToSignIn(from: self)
    }
    
    fileprivate func prepareObservable() {
        homePageData.observeNext { value in
            if value.collection.count > 0 {
              self.cartButton.isEnabled = true
            } else {
                self.cartButton.isEnabled = false
            }
            }.dispose(in: bagData)
        
        homePageData.bind(to: tableView, animated: true) {dataSource, indexPath, tableView in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell else { return UITableViewCell() }
            let data = dataSource[indexPath.row]
            cell.configureCell(data: data)
            return cell
        }.dispose(in: bagData)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        bagData.dispose()
    }
}

extension CartView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePageData.count
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action, indexPath) in
           var confirmtionalert = UIAlertController(title: "Delete", message: "Are you sure to remove this item from your basket?", preferredStyle: UIAlertControllerStyle.alert)
            confirmtionalert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
                self.presenter?.interactor?.deleteData(self.homePageData[indexPath.row])
            }))

            confirmtionalert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            self.present(confirmtionalert, animated: true, completion: nil)
        })
        deleteAction.backgroundColor = UIColor.red
        return[deleteAction]
    }
}
