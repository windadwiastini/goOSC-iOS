//
//  BalancePaymentView.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class BalancePaymentView: UIViewController, BalancePaymentViewProtocol {
    var presenter: BalancePaymentPresenterProtocol?
    
    @IBOutlet weak var voucher: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var total: UILabel!
    fileprivate var dataSource = [CartEntity.SingleCart]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BalancePaymentWireFrame.createBalancePaymentModule(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
        tableView.dataSource = self
    }
    
    func updateData(response: BalancePayment.Response) {
        let data = response.data
        voucher.text = data?.voucher
        finalPrice.text = String(data!.total)
        discount.text = String(data!.total_discount)
        total.text = String(data!.final_price)
        dataSource = data!.product_list
        tableView.reloadData()
    }
    
    @IBAction func processPayment(_ sender: Any) {
        presenter?.interactor?.doPaymentBalance()
    }
    
    func showAlertAndDismis(title titleData: String, message messageData: String) {
        let alert = UIAlertController(title: titleData, message: messageData, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension BalancePaymentView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell") as! PaymentCell
        let data = dataSource[indexPath.row]
        cell.configureCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Product List"
    }
    
}
