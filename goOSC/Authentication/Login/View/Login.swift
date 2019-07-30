//
//  Login.swift
//  goOSC
//
//  Created by Bootcamp on 28/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Foundation
import ReactiveKit
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

class Login: UIViewController, LoginViewProtocol, WKNavigationDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var btnLogin: UIButton!
    var webView: WKWebView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var presenter: LoginPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginWireframe.createLoginModule(self)
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.customUserAgent = "Chrome/56.0.0.0 Mobile"
        usernameField.delegate = self
        passwordField.delegate = self
        configureAction()
        
    }
    
    fileprivate func configureAction() {
        btnLogin.isEnabled = false
        combineLatest(usernameField.reactive.text, passwordField.reactive.text) {email, password in
            return email!.count > 0 && password!.count > 0
            }.bind(to: btnLogin.reactive.isEnabled)
        btnLogin.reactive.controlEvents(.touchUpInside).observeNext { e in
            self.login()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
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
    
    func login(){
        let username = usernameField.text
        let pasword = passwordField.text
        let user = Customer.Request(name: "", email: username!, password: pasword!)
        presenter?.interactor?.doLogin(user)
    }
    
    func openAlert(_ title: String, _ context: String) {
        let alert = UIAlertController(title: title, message: context, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func loadWeb(_ url: URL) {
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
        print(urlString)
        if (urlString?.contains("callback"))! {
        webView.evaluateJavaScript("document.getElementsByTagName('pre')[0].innerHTML.toString()", completionHandler: { result, error in
            print(result)
            if let element = result {
                let defaults = UserDefaults.standard
                defaults.set(false, forKey: "loggedIn")
                let jsonDecode = (result! as! String).parse(to: Customer.Response.self)
                self.webView.removeFromSuperview()
                if jsonDecode?.code == 200 {
                    defaults.set(jsonDecode?.data!.user!.id, forKey: "userId")
                    defaults.set(jsonDecode?.data!.user!.email, forKey: "email")
                    defaults.set(jsonDecode?.data!.user!.firstname, forKey: "firstname")
                    defaults.set(jsonDecode?.data!.user!.lastname, forKey: "lastname")
                    defaults.set(jsonDecode?.data!.user!.role_id, forKey: "roleId")
                    defaults.set(jsonDecode?.data!.user!.role_name, forKey: "roleName")
                    defaults.set(true, forKey: "loggedIn")
                    self.presenter?.wireFrame?.routeToHomePage(from: self)
                } else {
                    self.openAlert("Login", jsonDecode!.message)
                }
            }

            })
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let newTag = textField.tag + 1
        
        if let next = view.viewWithTag(newTag) {
            next.becomeFirstResponder()
        } else {
            login()
        }
        return true
    }
}
