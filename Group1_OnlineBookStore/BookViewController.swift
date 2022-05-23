//
//  BookViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//
//let myViewController = ShoppingCartViewController(nibName: "ShoppingCartViewController", bundle: nil)
//      self.present(myViewController, animated: true, completion: nil)
import UIKit

class BookViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var bookName: UILabel!
    var reviews = [Review]()
    override func viewDidLoad() {
        super.viewDidLoad()
        bookName.text = "Welcome"
        if  let review = Review(userID: 1, content: "", ratingValue: 4, bookID: 1) {
            reviews.append(review)          }
        //        reviewTableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        //
        if reviewTableView != nil {
            print("nil")
            reviewTableView.dataSource = self
        }
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "cell"
        var cell: ReviewTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewTableViewCell
        }
        let review = reviews[indexPath.row]
        cell.username.text = String(review.userID)
        cell.content.text = review.content
        cell.ratingControl.setRatingValue(ratingValue: review.ratingValue)
        return cell
        //        if let cell = reviewTableView.dequeueReusableCell(withIdentifier: reuseIndentifier, for: indexPath) as? ReviewTableViewCell {
        //            let review = reviews[indexPath.row]
        //            cell.username.text = review.username
        //            cell.content.text = review.content
        //            cell.ratingControl.setRatingValue(ratingValue: review.ratingValue)
        //            return cell
        //        } else {
        //
        //        }
        
    }
}
