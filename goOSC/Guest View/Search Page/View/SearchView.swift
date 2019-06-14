//
//  SearchView.swift
//  goOSC
//
//  Created by Bootcamp on 6/12/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class SearchView: UIViewController, SearchViewProtocol {
    var presenter: SearchPresenterProtocol?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var productList = HomePage.Response(code: 0, message: "", data: [], length: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        SearchWireFrame.createSearchModule(with: self)
    }
    
    func updateData(response: HomePage.Response) {
        productList = response
        tableView.reloadData()
    }
    
    @IBAction func doSignOut(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        presenter?.wireframe?.routeToSignIn(from: self)
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchProductCell") as? SearchProductCell else { return UITableViewCell() }
        let data = productList.data[indexPath.row]
        cell.configureCell(data: data!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        presenter?.wireframe?.routeToDetail(from: self, with: productList.data[indexPath.row]!)
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != "" {
            presenter?.interactor?.sendGetProductRequest(with: searchBar.text!)
        } else {
            productList = HomePage.Response(code: 0, message: "", data: [], length: 0)
            tableView.reloadData()
        }
        
    }
}
