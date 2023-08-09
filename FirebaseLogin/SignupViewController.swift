//
//  SignupViewController.swift
//  FirebaseLogin
//
//  Created by Gamze Akyüz on 9.06.2023.
//

import UIKit
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var againEmailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 10.0
        
        passwordTextfield.isSecureTextEntry = true
    }
    
    @IBAction func button_signUp(_ sender: Any) {
        
        signUp(email: emailTextField.text!, password: passwordTextfield.text!, name: nameTextField.text!, emailAgain: againEmailTextfield.text!)
        
    }
    
    @IBAction func button_login(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        self.show(vc!, sender: nil)
    }
    func signUp(email: String, password: String,name: String, emailAgain: String) {

        Auth.auth().createUser(withEmail: email, password: password)

        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                // Giriş sırasında bir hata oluştu
                print("Giriş hatası: \(error.localizedDescription)")
                self.showAlert(title: "Alert", message: "You cannot register. Check your email address or password.")
            } else {
                // Giriş başarılı
                print("Giriş başarılı")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
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
