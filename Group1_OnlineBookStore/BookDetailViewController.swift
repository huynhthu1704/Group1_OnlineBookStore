//
//  BookViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController{

    @IBOutlet weak var reviewTableView: UITableView!
    var reviews = [Review]()
       override func viewDidLoad() {
           super.viewDidLoad()
           if  let review = Review(username: "thuhuynh", content: "It is fantastic", ratingValue: 4) {
                  reviews.append(review)
//           }
//        self.reviewTableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
//
//           reviewTableView.dataSource = self

           // Do any additional setup after loading the view.
       }
//       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           reviews.count
//       }
//
//       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let reuseIndentifier = "cell"
//           if let cell = reviewTableView.dequeueReusableCell(withIdentifier: reuseIndentifier, for: indexPath) as? ReviewTableViewCell {
//               let review = reviews[indexPath.row]
//                              cell.username.text = review.username
//                              cell.content.text = review.content
//                              cell.ratingControl.setRatingValue(ratingValue: review.ratingValue)
//                              return cell
//                          } else {
//                              fatalError("Can not create the cell")
//                          }
//
       }
}
