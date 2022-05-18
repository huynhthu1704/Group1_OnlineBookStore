//
//  HomeScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBAction func button(_ sender: UIButton) {

        let myViewController = SignInViewController(nibName: "SignInViewController", bundle: nil)
        self.navigationController?.pushViewController(myViewController, animated: true)
//        self.present(myViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//                let viewAllOrdersController = MyOrdersViewController(nibName: "MyOrdersViewController", bundle: nil)
                //        self.present(viewAllOrdersController, animated: true, completion: nil)
                //viewAllOrdersController.navigationItem.title = "My orders"

    }

}
