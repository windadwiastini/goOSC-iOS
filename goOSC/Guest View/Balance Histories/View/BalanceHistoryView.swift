//
//  BalanceHistoryView.swift
//  goOSC
//
//  Created by Bootcamp on 28/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class BalanceHistoryView: UIViewController, BalanceHistoryViewProtocol {
    weak var presenter: BalanceHistoryPresenterProtocol?
    fileprivate var dataSource = [BalancdHistory.SingleData]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BalanceHistoryWireFrame.createBalanceHistoryModule(self)
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    func updateView(response resp: BalancdHistory.Response) {
        dataSource = resp.data.list
        tableView.reloadData()
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension BalanceHistoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BalanceHistoryCell") as? BalanceHistoryCell else { return UITableViewCell() }
        let data = dataSource[indexPath.row]
        if data.credit > 0 {
            cell.amountLabel.text = String(data.credit)
            cell.imageLabel.image = UIImage.init(named: "icons8-color-96")
        } else {
            cell.amountLabel.text = String(data.debit)
            cell.imageLabel.image = UIImage.init(named: "icons8-request-money-96")
        }
        return cell
    }
}
