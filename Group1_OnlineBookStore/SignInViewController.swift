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
        print("SignUp")
        let signUpViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        signUpViewController.modalPresentationStyle = .fullScreen
        present(signUpViewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    
    @IBAction func forGotPassword(_ sender: UITapGestureRecognizer) {
        print("Forgot")
        let forgotPasswordViewController = ForgotPasswordViewController(nibName: "ForgotPasswordViewController", bundle: nil)
          forgotPasswordViewController.modalPresentationStyle = .fullScreen
          present(forgotPasswordViewController, animated: true, completion: nil)
//               self.navigationController?.pushViewController(forgotPasswordViewController, animated: true)
    }
    @IBAction func signIn(_ sender: Any) {
        //SaveData.bookModel.getAllData()
        let currentUser = User(id: 2, fullName: "", pwd: "", phoneNumber: "", slug: "", rank: "", role_id: 1)
        SaveData.userModel.getAllData()
        SaveData.bookModel.getAllData()
        SaveData.favoriteModel.getOrderedBookByOrderId(userID: currentUser.id)
        let tabBar = self.storyboard?.instantiateViewController(identifier: "TabBar")
        UIApplication.shared.windows.first?.rootViewController = tabBar
        UIApplication.shared.windows.first?.makeKeyAndVisible()
//        guard let email = emailField.text, !email.isEmpty,
//            let password = passwordField.text, !password.isEmpty else {
//                print("Missing data")
////                return
//        }
//        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
//            guard let strongSelf = self else {
//                return
//            }
//            guard error == nil else {
//                strongSelf.showCreateAccount(email: email, password: password)
//                return
//            }
//            let myViewController = HomeScreenViewController()
//            self!.navigationController?.pushViewController(myViewController, animated: true)
//        })
        
    }
    
    func showCreateAccount(email : String, password : String) {
        let alert = UIAlertController(title: "Create account", message: "Would you like to create account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
           
            //
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in }))
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.autocapitalizationType = .none
        passwordField.isSecureTextEntry = true
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white ]
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
//        if FirebaseAuth.Auth.auth().currentUser != nil {
//
//            print("Account existted")
//        }
    }
    
}
