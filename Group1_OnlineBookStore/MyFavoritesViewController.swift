//
//  MyFavoritesViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class MyFavoritesViewController: UIViewController , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "cell"
        var cell: MyFavoritesTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? MyFavoritesTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "MyFavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? MyFavoritesTableViewCell
        }
        let book = books[indexPath.row]
        cell.img.image = book.slug
        cell.bookName.text = book.name
        cell.authorName.text = book.author
        cell.publisher.text = book.publisher
        cell.price.text = String(book.price)
        cell.ratingControl.setRatingValue(ratingValue: 4)
        return cell;
    }
    
    
    
    @IBOutlet weak var favoritesTableView: UITableView!
    var books = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        purchaseBtn.layer.cornerRadius = purchaseBtn.bounds.size.height/4
        let book = Book(id: "1", name: "Xu xu dung khoc", author: "Hong Sakura", publisher:
            "Hoi nha van", price: 120000, quantity: 1, totalSold: 0, slug: UIImage(named: "XuXu")!, summary: "This is a good book, it's really interesting", category: "Fairy tale")
        books.append(book)
        favoritesTableView.dataSource = self
    }
}
