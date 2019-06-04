//
//  Login.swift
//  goOSC
//
//  Created by Bootcamp on 28/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Foundation

import WebKit

extension String {
    func parse<D>(to type: D.Type) -> D? where D: Decodable {
        let data: Data = self.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        do {
            let _object = try decoder.decode(type, from: data)
            return _object
        } catch {
            return nil
        }
    }
}

class Login: UIViewController, LoginViewProtocol, WKNavigationDelegate {
    
    var webView: WKWebView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var presenter: LoginPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginWireframe.createLoginModule(self)
        presenter?.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.customUserAgent = "Chrome/56.0.0.0 Mobile"
//        webView.getSettings().setUserAgentString("Chrome/56.0.0.0 Mobile");
    }
    
    @IBAction func redirectToForgotPassword(_ sender: Any) {
        
    }
    
    @IBAction func loginWithTwitterBtnWasPressed(_ sender: Any) {
        presenter?.loginWithSocialMedia(type: "twitter")
    }
    
    @IBAction func loginWithGoogleBtnWasPressed(_ sender: Any) {
        presenter?.loginWithSocialMedia(type: "google")
    }
    
    @IBAction func loginWithFacebookBtnWasPressed(_ sender: Any) {
        presenter?.loginWithSocialMedia(type: "facebook")
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        let username = usernameField.text
        let pasword = passwordField.text
        let user = Customer.Request(name: "", email: username!, password: pasword!)
        print("login clicked")
        presenter?.interactor?.doLogin(user)
    }
    
    func openAlert(_ title: String, _ context: String) {
        let alert = UIAlertController(title: title, message: context, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {resp in
            self.presenter?.wireFrame?.routeToRegister(from: self)
        }))
        present(alert, animated: true)
    }
    
    func loadWeb(_ url: URL) {
        print("sampai view load")
        let frame = view.frame
        webView.frame = CGRect(x: 0, y: 0, width: frame.maxX, height: frame.maxY)
        webView.sizeToFit()
        view.addSubview(webView)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Page Did Finished")
        let urlString = webView.url?.absoluteString
        if (urlString?.contains("callback"))! {
            print(urlString)
            webView.evaluateJavaScript("document.getElementsByTagName('pre')[0].innerHTML.toString()", completionHandler: { result, error in
                print(result!)
                let jsonDecode = (result! as! String).parse(to: Customer.Response.self)
//                let jsonDecode = try! JSONDecoder().decode(Customer.Response.self, from: result! as! Data)
                print(jsonDecode?.data?.user?.firstname)
                self.webView.removeFromSuperview()
                if jsonDecode?.code == 200 {
                    self.presenter?.wireFrame?.routeToRegister(from: self)
                } else {
                    self.openAlert("Login", jsonDecode!.message)
                }

            })
        }
    }
}
