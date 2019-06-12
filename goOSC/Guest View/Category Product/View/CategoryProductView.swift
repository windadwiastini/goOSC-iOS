//
//  CategoryProductView.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class CategoryProductView: UIViewController, CategoryProductViewProtocol {
    
    var presenter: CategoryProductPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    var productList = HomePage.Response(code: 0, message: "", data: [], length: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        presenter?.viewDidLoad()
    }

    func updateData(response: HomePage.Response, category: Category.NewData) {
        productList = response
        categoryNameLabel.text = category.name
        tableView.reloadData()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CategoryProductView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCategoryCell") as? CategoryProductCell else { return UITableViewCell() }
        cell.configureCell(product: productList.data[indexPath.row]!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.wireframe?.routeToDetail(from: self, with: productList.data[indexPath.row]!)
    }
}
