//
//  MyOrdersViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-18.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController, UITableViewDataSource {

    var orderedBooks = [OrderedBook]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchStackView.setBackgroundColor(.white)
        orderTableView.dataSource = self
        let book = Book(id: "1", name: "Xu Xu dung khoc", author: "Pham Van Thanh", publisher: "Ha Noi", price: 11, quantity: 15, totalSold: 14, slug: UIImage(named: "XuXu"), summary: "x", category: "x")
        let book1 = Book(id: "2", name: "Green miles", author: "Ngoc Thu", publisher: "Ha Noi", price: 13, quantity: 15, totalSold: 14, slug: UIImage(named: "User's image"), summary: "x", category: "x")
        orderedBooks.append(OrderedBook(book: book, amount: 2))
        orderedBooks.append(OrderedBook(book: book1, amount: 3))
        orderedBooks.append(OrderedBook(book: book1, amount: 3))
        orderedBooks.append(OrderedBook(book: book, amount: 2))
        
    }
    
    
    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var searchStackView: UIStackView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "OrdersTableViewCell"
        var cell: OrdersTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrdersTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrdersTableViewCell
        }
        let orderedBook = orderedBooks[indexPath.row]
        cell.lblState.text = "To received"
        cell.imageBook.image = orderedBook.book.slug
        cell.lblBookName.text = orderedBook.book.name + " - " + orderedBook.book.author
        cell.lblAmountPrice.text = "Amount: \(orderedBook.amount) |  $\(orderedBook.book.price)"
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
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
