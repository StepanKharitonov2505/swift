//
//  LoginFromController.swift
//  VKontakte
//
//  Created by Степан Харитонов on 28.10.2021.
//

import UIKit

class LoginFromController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
               ScrollView?.addGestureRecognizer(hideKeyboardGesture)
       
    }
    
    @IBAction func LoginButtomPressed(_ sender: Any) {
        
        let login = LoginInput.text!
        
        let password = PasswordInput.text!
        
        if login == "admin" && password == "123456" {
            print("успешная авторизация")
        } else {
            print("Введен не верный логин/пароль")
        }
        
    }
    
    @IBOutlet weak var LoginInput: UITextField!
    
    @IBOutlet weak var PasswordInput: UITextField!
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.ScrollView?.contentInset = contentInsets
        ScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification:Notification) {
        let contentInsets = UIEdgeInsets.zero
        ScrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.ScrollView?.endEditing(true)
    }
    
    
    
}
