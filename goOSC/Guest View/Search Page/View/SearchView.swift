//
//  SearchView.swift
//  goOSC
//
//  Created by Bootcamp on 6/12/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class SearchView: UIViewController, SearchViewProtocol {
    weak var presenter: SearchPresenterProtocol?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    fileprivate var productList = Observable<HomePage.Response>( HomePage.Response(code: 0, message: "", data: [], length: 0))
    fileprivate var data = MutableObservableArray([HomePage.Product]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        searchBar.delegate = self
        SearchWireFrame.createSearchModule(with: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareObservable()
    }
    
    func updateData(response: HomePage.Response) {
        productList.value = response
    }
    
    @IBAction func doSignOut(_ sender: Any) {
        SignOut().hitSignOutButton(view: self)
    }
    
    fileprivate func prepareObservable() {
        productList.observeNext { value in
            self.data.removeAll()
            value.data.map{ e in
                if let element = e {
                 self.data.append(element)
                }
            }
        }.dispose(in: bag)
        
        data.bind(to: tableView, animated: true) {datasource, indexPath, tableView in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchProductCell") as? SearchProductCell else { return UITableViewCell() }
            let data = datasource[indexPath.row]
            cell.configureCell(data: data)
            return cell
        }.dispose(in: bag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        bag.dispose()
    }
}

extension SearchView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.wireframe?.routeToDetail(from: self, with: data[indexPath.row])
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != "" && searchBar.text?.count ?? 0 > 2 {
            if let text = searchBar.text {
             presenter?.interactor?.sendGetProductRequest(with: text)
            }
        } else {
            productList.value = HomePage.Response(code: 0, message: "", data: [], length: 0)
        }
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
}
