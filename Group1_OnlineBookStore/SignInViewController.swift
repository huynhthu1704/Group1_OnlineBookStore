//
//  SignInViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    @IBAction func signUp(_ sender: UITapGestureRecognizer) {
        let myViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        self.navigationController?.pushViewController(myViewController, animated: true)
    }
    
    
    @IBAction func signIn(_ sender: Any) {
        guard let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty else {
                print("Missing data")
                return
        }
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else {
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            let myViewController = HomeScreenViewController()
            self!.navigationController?.pushViewController(myViewController, animated: true)
        })
    }
    
    func showCreateAccount(email : String, password : String) {
        let alert = UIAlertController(title: "Create account", message: "Would you like to create account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            let myViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
            self.navigationController?.pushViewController(myViewController, animated: true)
            //
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in }))
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.autocapitalizationType = .none
        passwordField.isSecureTextEntry = true
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            
            print("Account existted")
        }
    }
    
}
