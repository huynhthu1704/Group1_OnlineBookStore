//
//  HomeScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit
import FirebaseAuth
class HomeScreenViewController: UIViewController {

    @IBAction func button(_ sender: UIButton) {
        let shoppingCartVC = BookDetailViewController(nibName: "BookDetailViewController", bundle: nil)
               self.navigationController?.pushViewController(shoppingCartVC, animated: true)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if (FirebaseAuth.Auth.auth().currentUser == nil) {
        }
                  
    }

}
