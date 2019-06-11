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
    var homePageData = HomePage.Response(code: 0, message: "", data: [], length: 0)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        HomePageWireFrame.createHomePageModule(self)
        presenter?.viewDidLoad()
//        print("Homepage loaded")
    }
    
    func updateData(response: HomePage.Response) {
        homePageData = response
        self.tableView.reloadData()
    }
}

extension HomePageView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePageData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homePageCell") as? HomePageCell else { return UITableViewCell() }
        let data = homePageData.data[indexPath.row]
        cell.configureCell(data: data!)
        return cell
    }
}
