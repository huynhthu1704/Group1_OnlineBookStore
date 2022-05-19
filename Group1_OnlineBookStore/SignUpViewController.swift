//
//  SignUpViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var birthDay: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var passwordConfirm: UITextField!
    
    @IBAction func signIn(_ sender: UITapGestureRecognizer) {
        let signIn = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SignInScreen")
        signIn.modalPresentationStyle = .fullScreen
        present(signIn, animated: true, completion: nil)
    }
    @IBAction func signUp(_ sender: RoundedButton) {
//        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self]result, error in
        //                guard let strongSelf = self else {
        //                    return
        //                }
        //                guard error == nil else {
        //
        //                    return
        //                }
        //
        //            })
        let tabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBar")
               UIApplication.shared.windows.first?.rootViewController = tabBar
               UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
