//
//  BalancePaymentView.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit
class BalancePaymentView: UIViewController, BalancePaymentViewProtocol {
    var presenter: BalancePaymentPresenterProtocol?
    
    @IBOutlet weak var voucher: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var total: UILabel!
    fileprivate var dataSource = MutableObservableArray([CartEntity.SingleCart]())
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BalancePaymentWireFrame.createBalancePaymentModule(self)
        prepareObservable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    func updateData(response: BalancePayment.Response) {
        let data = response.data
        voucher.text = data.voucher
        finalPrice.text = String(data.total)
        discount.text = String(data.totalDiscount)
        total.text = String(data.finalPrice)
        dataSource.removeAll()
        dataSource.replaceElements(with: data.productList )
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
    
    fileprivate func prepareObservable() {
        dataSource.bind(to: tableView, animated: true) {dataSource, indexPath, tableView in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell") as? PaymentCell else {return UITableViewCell()}
            let data = dataSource[indexPath.row]
            cell.configureCell(data: data)
            return cell
        }.dispose(in: bag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        bag.dispose()
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
