//
//  CategoryProductView.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit
class CategoryProductView: UIViewController, CategoryProductViewProtocol {
    
    weak var presenter: CategoryProductPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    fileprivate var productList = Observable<HomePage.Response>( HomePage.Response(code: 0, message: "", data: [], length: 0))
    fileprivate var data = MutableObservableArray([HomePage.Product]())
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareObserve()
    }
    func updateData(response: HomePage.Response, category: Category.NewData) {
        productList.value = response
        categoryNameLabel.text = category.name
        tableView.reloadData()
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doSignOut(_ sender: Any) {
        SignOut().hitSignOutButton(view: self)
    }
    
    fileprivate func prepareObserve() {
        productList.observeNext { value in
            self.data.removeAll()
            value.data.map { e in
                if let element = e {
                 self.data.append(element)
                }
            }
        }.dispose(in: bag)
        
        data.bind(to: tableView, animated: true) { dataSource, indexPath, tableView in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCategoryCell") as? CategoryProductCell else { return UITableViewCell() }
            cell.configureCell(product: dataSource[indexPath.row])
            return cell
        }.dispose(in: bag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        bag.dispose()
    }
}

extension CategoryProductView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.wireframe?.routeToDetail(from: self, with: data[indexPath.row])
    }
}
