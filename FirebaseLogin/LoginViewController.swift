//
//  LoginViewController.swift
//  FirebaseLogin
//
//  Created by Gamze Akyüz on 9.06.2023.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 10.0
        
        passwordTextField.isSecureTextEntry = true

    }
    @IBAction func button_signup(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVc")
        show(vc!, sender: nil)
    }
    @IBAction func button_login(_ sender: Any) {
        
        signIn(email: emailTextField.text!, password: passwordTextField.text!)
        
    }
    @IBAction func button_password(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordVC")
        show(vc!, sender: nil)
    }
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                // Giriş sırasında bir hata oluştu
                self.showAlert(title: "Alert", message: "Login Error.Check your email or password!")
                print("Giriş hatası: \(error.localizedDescription)")
            } else {
                // Giriş başarılı
                print("Giriş başarılı")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainVC")
                self.show(vc!, sender: nil)
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Close", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true,completion: nil)
    }
    
}
