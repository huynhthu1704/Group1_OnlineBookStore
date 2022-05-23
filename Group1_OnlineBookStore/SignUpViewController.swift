//
//  SignUpViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        fullName.delegate = self
        
        email.delegate = self
        password.delegate = self
        passwordConfirm.delegate = self
           self.navigationController?.navigationBar.tintColor = UIColor.white
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    
    @IBAction func signIn(_ sender: UITapGestureRecognizer) {
        let signIn = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignInScreen")
        signIn.modalPresentationStyle = .fullScreen
        present(signIn, animated: true, completion: nil)
    }
    @IBAction func signUp(_ sender: RoundedButton) {
        guard let fullName = fullName.text, !fullName.isEmpty,
            let  email = email.text, !email.isEmpty,
            let password = password.text, !password.isEmpty,
            let confirmPassword = passwordConfirm.text, !confirmPassword.isEmpty else {
                let alert = UIAlertController(title: "Warning", message: "Missing data", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                }))
                present(alert, animated: true)
                return
        }
        if !password.elementsEqual(confirmPassword) {
            let alert = UIAlertController(title: "Warning", message: "Confirm password is not correct", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            }))
            present(alert, animated: true)
        } else {
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self]result, error in
                guard let strongSelf = self else {
                    print("1")
                    return
                }
                guard error == nil else {
                    let alert = UIAlertController(title: "Warning", message: error?.localizedDescription, preferredStyle: .alert)
                               alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                               }))
                    self!.present(alert, animated: true)
                    return
                }
                
                let user = User(id: 0, fullName: fullName, pwd: password, email: email, slug: "", rank: "", role_id: 2)
                SaveData.userModel.addUser(user: user)
                let tabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBar")
                UIApplication.shared.windows.first?.rootViewController = tabBar
                UIApplication.shared.windows.first?.makeKeyAndVisible()
                SaveData.userModel.getCurrentUser()

            })
        }
    }
    
   
}
