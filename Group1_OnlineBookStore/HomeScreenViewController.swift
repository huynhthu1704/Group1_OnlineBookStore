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

        let myViewController = ViewAllCommentViewController(nibName: "ViewAllCommentViewController", bundle: nil)
        self.present(myViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
