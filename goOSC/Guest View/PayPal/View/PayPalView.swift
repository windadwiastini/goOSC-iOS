//
//  PayPalView.swift
//  goOSC
//
//  Created by Bootcamp on 15/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

class PayPalView: UIViewController, PayPalPaymentDelegate, PaypalViewProtocol {
    fileprivate var payPalConfig = PayPalConfiguration()
    fileprivate var data: PaypalEntity.Response?
    fileprivate var acceptCreditCard:Bool = true {
        didSet {
            payPalConfig.acceptCreditCards = acceptCreditCard
        }
    }
    var presenter: PaypalPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PayPalWireframe.createPaypalModule(self)
        payPalConfig.acceptCreditCards = acceptCreditCard
        payPalConfig.merchantName = "goOSC"
        PayPalMobile.preconnect(withEnvironment: PayPalEnvironmentSandbox)
        presenter?.viewDidLoad()
    }
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        paymentViewController.dismiss(animated: true, completion: {() -> Void in
            self.presenter?.interactor?.doPaymentPaypal(self.data!)
            
            print("here us your proof of payment : \n\n \(completedPayment.confirmation) \n \n send this to your server for confirmation and fulfillment.")
        })
    }
    
    func showPaypalLaman(response resp: PaypalEntity.Response) {
        data = resp
        var items = [PayPalItem]()
        for item in resp.Data.payment_data.product_list {
            var item1 = PayPalItem(name: item.product_name , withQuantity: 1, withPrice: NSDecimalNumber(string: "\(item.price)"), withCurrency: resp.Data.payment_data.currency, withSku: item.product_id)
            items.append(item1)
        }

        let subtotal = PayPalItem.totalPrice(forItems: items)
        let shipping = NSDecimalNumber(string: "0.0")
        let tax = NSDecimalNumber(string: "0.0")
        let paymentDetail = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
        let total = subtotal
        let payment = PayPalPayment(amount: total, currencyCode: resp.Data.payment_data.currency, shortDescription: "Total", intent: .sale)
        payment.items = items
        payment.paymentDetails = paymentDetail

        if payment.processable {
            let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
            present(paymentViewController!, animated: true, completion: nil)
        } else {
            print("Payment not processable \(payment)")
        }
    }
    
    func dismiss(_ resp: PaypalEntity.ResponseDoPayment) {
        Alert().informationAlert(title: "Payment", message: resp.PaymentMessage, ui: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
