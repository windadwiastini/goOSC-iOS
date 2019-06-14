//
//  CategoryPageView.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class CategoryPageView: UIViewController, CategoryPageViewProtocol {

    var presenter: CategoryPagePresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    var categoryData = Category.Response(code: 0, message: "", data: [])
    var cellDataList = [Category.CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        CategoryPageWireFrame.createCategoryPageModule(self)
        presenter?.viewDidLoad()
    }
    
    func updateData(response: Category.Response) {
        categoryData = response
        for data in categoryData.data! {
            let newData = Category.CellData(opened: true, category: data)
            cellDataList.append(newData)
        }
        tableView.reloadData()
    }
    
    @IBAction func doSignOut(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        presenter?.wireFrame?.routeToSignIn(from: self)
    }

}

extension CategoryPageView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cellDataList[section].opened == true {
            return (cellDataList[section].category.sub_category?.count)! + 1
        } else {
            return 1
        }
//        return categoryData.data!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryPageCell") as? CategoryPageCell else { return UITableViewCell() }
            cell.configureCell(title: cellDataList[indexPath.section].category.category_name, type: "category")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryPageCell") as? CategoryPageCell else { return UITableViewCell() }
            cell.configureCell(title: cellDataList[indexPath.section].category.sub_category![indexPath.row - 1].subcategory_name, type: "subcategory")
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let category = cellDataList[indexPath.section].category
            let data = Category.NewData(id: category.category_id, name: category.category_name, type: "category")
            presenter?.showCategoryProduct(with: data, from: self)
        } else {
            let category = cellDataList[indexPath.section].category.sub_category![indexPath.row-1]
            let data = Category.NewData(id: category.subcategory_id, name: category.subcategory_name, type: "subcategory")
            presenter?.showCategoryProduct(with: data, from: self)
        }
        
        
//        if indexPath.row == 0 {
//            if cellDataList[indexPath.section].opened == true {
//                cellDataList[indexPath.section].opened = false
//                let sections = IndexSet.init(integer: indexPath.section)
//                tableView.reloadSections(sections, with: .none)
//            } else {
//                cellDataList[indexPath.section].opened = true
//                let sections = IndexSet.init(integer: indexPath.section)
//                tableView.reloadSections(sections, with: .none)
//            }
//        }
    }
    
}
