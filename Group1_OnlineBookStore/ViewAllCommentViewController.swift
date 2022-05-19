//
//  ViewAllCommentViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ViewAllCommentViewController: UIViewController , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "cell"
        var cell: ReviewTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewTableViewCell
        }
        let review = reviews[indexPath.row]
        cell.username.text = review.userID
        cell.content.text = review.content
        cell.ratingControl.setRatingValue(ratingValue: review.ratingValue)
        return cell
    }
    
    
    @IBOutlet weak var viewAllComment: RoundedButton!
    
    @IBOutlet weak var reviewTableView: UITableView!
    var reviews = [Review]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Reviews"
        if let review = Review(userID: "us1", content: "It is fantastic", ratingValue: 4, bookID: "B01") {
            reviews.append(review)
        }
        if let review = Review(userID: "us2", content: "This is really a good book for every one", ratingValue: 4, bookID: "B02") {
            reviews.append(review)
        }
        if let review = Review(userID: "us3", content: "I'm excited to read this book", ratingValue: 5, bookID: "B03") {
            reviews.append(review)
        }
        
        reviewTableView.dataSource = self
        
    }
}
