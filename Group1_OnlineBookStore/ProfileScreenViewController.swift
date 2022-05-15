//
//  ProfileScreenViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-15.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ProfileScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func viewAllMyOrders(_ sender: UIButton) {
        let viewAllOrdersController = MyOrdersViewController(nibName: "MyOrdersViewController", bundle: nil)
//        self.present(viewAllOrdersController, animated: true, completion: nil)
        viewAllOrdersController.navigationItem.title = "My orders"
        navigationController?.pushViewController(viewAllOrdersController, animated: true)
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
