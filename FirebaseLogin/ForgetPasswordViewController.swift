//
//  ForgetPasswordViewController.swift
//  FirebaseLogin
//
//  Created by Gamze Akyüz on 9.06.2023.
//

import UIKit
import FirebaseAuth

class ForgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 10.0
    }
    @IBAction func button_forgetPassword(_ sender: Any){
        resetPassword(email: passwordTextField.text!)
    }
    func resetPassword(email: String) {
        
        if passwordTextField.text != "" {
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                if let error = error {
                    // Şifre sıfırlama hatası
                    print("Şifre sıfırlama hatası: \(error.localizedDescription)")
                    self.showAlert(title: "Alert", message: "Password reset error. Check your Email Address")
                } else {
                    // Şifre sıfırlama e-postası gönderildi
                    print("Şifre sıfırlama e-postası gönderildi")
                    self.showAlert(title: "İnfo", message: "Password privacy email sent.Check your Email Address")
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Close", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true,completion: nil)
    }
    @IBAction func loginVC(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        self.show(vc!, sender: nil)
    }

}
