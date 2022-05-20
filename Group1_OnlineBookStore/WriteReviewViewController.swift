//
//  WriteReviewViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class WriteReviewViewController: UIViewController {

    var book:Book?
    @IBOutlet weak var lblPublisher: UILabel!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var tvReview: UITextView!
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            imageBook.image = book.slug
            lblBookName.text = book.name
            lblPublisher.text = book.publisher
        }
    }

    @IBAction func submit(_ sender: UIButton) {
        print("\(tvReview.text!) \n \(ratingControl.ratingValue)")
    }
}
