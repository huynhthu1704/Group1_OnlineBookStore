//
//  SignInViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
           emailField.autocapitalizationType = .none
           passwordField.isSecureTextEntry = true
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.26, green: 0.36, blue: 0.86, alpha: 1)
           self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white ]
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            goToHomeScreen()
        }
       }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          self.view.endEditing(true)
          return false
      }
       
    @IBAction func signUp(_ sender: UITapGestureRecognizer) {
        print("SignUp")
        SaveData.userModel.getAllData()
        let signUpViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        signUpViewController.modalPresentationStyle = .fullScreen
        present(signUpViewController, animated: true, completion: nil)
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
//        let currentUser = User(id: 2, fullName: "", pwd: "", phoneNumber: "", slug: "", rank: "", role_id: 1)
        SaveData.bookModel.getAllData()
        SaveData.favoriteModel.getOrderedBookByOrderId(userID: 2)
        let email = emailField.text!
        let pwd = passwordField.text!
        if email.isEmpty ||
            pwd.isEmpty {
            let alert = UIAlertController(title: "Warning", message: "Missing data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.emailField.becomeFirstResponder()
            }))
            present(alert, animated: true)
        }else {
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: pwd, completion: { [weak self] result, error in
                guard let strongSelf = self else {
                    return
                }
                guard error == nil else {
                    let alert = UIAlertController(title: "Warning", message: error?.localizedDescription, preferredStyle: .alert)
                              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                            
                              }))
                    self!.present(alert, animated: true)
                    return
                }
                self!.goToHomeScreen()
            })
            
        }
        
        
    }
    func goToHomeScreen() {
        let tabBar = self.storyboard?.instantiateViewController(identifier: "TabBar")
                      UIApplication.shared.windows.first?.rootViewController = tabBar
                      UIApplication.shared.windows.first?.makeKeyAndVisible()
                      SaveData.userModel.getCurrentUser()
    }
    func showCreateAccount(email : String, password : String) {
        let alert = UIAlertController(title: "Create account", message: "Would you like to create account?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sign up", style: .default, handler: {_ in
          let signUpViewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
                   signUpViewController.modalPresentationStyle = .fullScreen
            self.present(signUpViewController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in }))
        present(alert, animated: true)
    }
   
}
