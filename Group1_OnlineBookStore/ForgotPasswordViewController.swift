//
//  ForgotPasswordViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func resetPassword(_ sender: Any) {
        let tabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBar")
        UIApplication.shared.windows.first?.rootViewController = tabBar
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
