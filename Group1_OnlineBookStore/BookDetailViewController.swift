//
//  BookDetailViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-16.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController, UITableViewDataSource {
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
    

    @IBAction func didLiked(_ sender: UIButton) {
    }
    // Properties
    
    @IBOutlet weak var likeBtn: UIButton!
    var reviews = [Review]()
    var books = [Book]()
    @IBOutlet weak var reviewTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        likeBtn.imageView?.layer.transform = CATransform3DMakeScale(1.8, 1.8, 1.8)
        let book = Book(id: "1", name: "Xu xu dung khoc", author: "Hong Sakura", publisher: "Hoi nha van", price: 120000, quantity: 1, totalSold: 0, slug: UIImage(named: "XuXu")!, summary: "This is a good book, it's really interesting", category: "Fairy tale")
        navigationController?.title = book.name
    }


  

}
