//
//  WriteReviewViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class WriteReviewViewController: UIViewController {

    @IBOutlet weak var reviewField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        reviewField.layer.borderWidth = 1
        reviewField.layer.borderColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
    }

}
