//
//  PurchaseViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return books.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let reuseIndentifier = "shoppingCartCell"
           var cell: ShoppingCartTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ShoppingCartTableViewCell
           if cell == nil {
               tableView.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
               cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ShoppingCartTableViewCell
           }
           let book = books[indexPath.row]
//           cell.bookImg.image = book.slug
           cell.bookName.text = book.name
           cell.price.text = String(book.price)
           cell.quantity.text = String(1)
           return cell
       }
       
    
    @IBOutlet weak var bookTableView: UITableView!
    var books = [Book]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        let book = Book(id: "1", name: "Xu xu dung khoc", author: "Hong Sakura",publisher: "Hoi nha van", price: 120000, quantity: 1, totalSold: 0, slug: "", summary: "This is a good book, it's really interesting", category: "Fairy tale")
//        books.append(book)
//        print(book.name)
        bookTableView.delegate = self
        bookTableView.dataSource = self
    }
    
   
}
