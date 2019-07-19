//
//  Voucher.swift
//  goOSC
//
//  Created by Bootcamp on 09/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class Voucher: UIViewController,VoucherViewProtocol {
    @IBOutlet weak var voucherValue: UITextField!
    var presenter: VoucherPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VoucherWireFrame.createVoucherModule(self)
    }
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addVoucher(_ sender: Any) {
        presenter?.interactor?.validateVoucher(voucher: voucherValue.text!)
    }
    func showAlertSuccess(response resp: VoucherEntity.ResponseSuccess) {
        let alert = UIAlertController(title: "Voucher", message: resp.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true)
    }
    
    func showAlertFail(response resp: VoucherEntity.ResponseFailed) {
        let alert = UIAlertController(title: "Voucher", message: resp.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}
