//
//  MyReviewsViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-20.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class MyReviewsViewController: UIViewController, UITableViewDataSource {
    
    var reviews = [Review]()
    
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var ReviewedBookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReviewedBookTableView.dataSource = self
        // Do any additional setup after loading th
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "ReviewedBookTableViewCell"
        var cell: ReviewedBookTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewedBookTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "ReviewedBookTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ReviewedBookTableViewCell
        }
        cell.viewForReview.layer.borderWidth = 2
        cell.viewForReview.layer.cornerRadius = 5
        cell.viewForReview.layer.borderColor = UIColor.black.cgColor
        return cell
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
