//
//  CartView.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class CartView: UIViewController, CartViewProtocol {
    
    var presenter: CartPresenterProtocol?
    var homePageData = [CartEntity.SingleCart]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        CartWireFrame.createCartModule(self)
        presenter?.viewDidLoad()
    }
//
    override func viewDidAppear(_ animated: Bool) {
        presenter?.interactor?.findAllData()
    }
    func updateData(response: [CartEntity.SingleCart]) {
        homePageData = response
        print("updatedata")
        print(homePageData)
        tableView.reloadData()
    }
//
    @IBAction func doSignOut(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        presenter?.wireFrame?.routeToSignIn(from: self)
    }
    
}

extension CartView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePageData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell else { return UITableViewCell() }
        let data = homePageData[indexPath.row]
        cell.configureCell(data: data)
        return cell
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

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.wireFrame?.routeToDetail(from: self, with: homePageData.data[indexPath.row]!)
//    }
}
