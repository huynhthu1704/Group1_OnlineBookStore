//
//  WriteReviewViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class WriteReviewViewController: UIViewController {

    var reviewModel = ReviewModel()
    var book:Book?
    @IBOutlet weak var lblPublisher: UILabel!
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var tvReview: UITextView!
    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
//            imageBook.image = book.slug
            if let url = URL(string: book.slug){
                let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                    guard let data = data, error == nil else{
                        return
                    }
                    
                    DispatchQueue.main.async{
                        
                        let img = UIImage(data: data)
                        self.imageBook.image = img
                    }
                })
                task.resume()
            }
            lblBookName.text = book.name
            lblPublisher.text = book.publisher
        }
    }

    @IBAction func submit(_ sender: UIButton) {
        if let book = self.book {
            if let user = SaveData.userModel.currentUser{
                reviewModel.reviewBook(bookID: book.id, userID: user.id, content: tvReview.text, ratingStar: ratingControl.ratingValue)
                let alert = UIAlertController(title: "WRITE REVIEW", message: "Review the book successfully!", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.popViewController(animated: true)
                }))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
