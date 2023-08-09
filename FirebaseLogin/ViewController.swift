//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by Gamze Akyüz on 8.06.2023.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 10.0
        
        if let user = Auth.auth().currentUser {
            let name = user.email?.split(separator: "@")
            nameLabel.text = name![0].description
            emailLabel.text = user.email
            // Profil sayfasına geçiş yapma işlemleri
        }
        
    }
    
    @IBAction func button_logout(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("Çıkış başarılı")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC")
            self.show(vc!, sender: nil)
        }catch{
            print("Error : \(error.localizedDescription)")
            showAlert(title: "Alert", message: "Wrong Email Adress.")
        }
        
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Close", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true,completion: nil)
    }


}

