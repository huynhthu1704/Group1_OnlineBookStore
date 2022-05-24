//
//  ShoppingCartViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController, UITableViewDataSource {
    // MARK: Properties
    @IBOutlet weak var shoppingCartTableView: UITableView!
    @IBOutlet weak var purchaseBtn: UIButton!
    var shoppingCart = SaveData.shoppingCartModel.shoppingCart
    var booksInShoppingCart = [BookInCart]()
    var books = SaveData.bookModel.books
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBAction func selectAllItem(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        SaveData.bookModel.getAllBooks(completion: {bookList in
            for i in 0..<bookList.count {
                for j in 0..<self.shoppingCart.count {
                    if self.shoppingCart[j].bookId == bookList[i].id {
                        let book = BookInCart(id : bookList[i].id, name: bookList[i].name, price: bookList[i].price, slug : bookList[i].slug, quantity: self.shoppingCart[j].quantity, quantityInStock: bookList[i].quantity)
                        self.booksInShoppingCart.append(book)
                        
                    }
                }
            }
            dump(self.booksInShoppingCart)
            self.shoppingCartTableView.dataSource = self
        })
    }
    
    //Click on purchase button
    @IBAction func purchase(_ sender: UIButton) {
    }
    
    // Number of row in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksInShoppingCart.count
    }
    
    // Render cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "shoppingCartCell"
        var cell: ShoppingCartTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ShoppingCartTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "ShoppingCartTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? ShoppingCartTableViewCell
        }
        let item = self.booksInShoppingCart[indexPath.row]
        print("itemname\(item.name)")
        cell.book = item
        cell.setUp(item: item)
        cell.vc = self
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.booksInShoppingCart.remove(at: indexPath.row)
            self.shoppingCartTableView.beginUpdates()
            self.shoppingCartTableView.deleteRows(at: [indexPath], with: .automatic)
            self.shoppingCartTableView.endUpdates()
        }
    }
}

struct BookInCart {
    var id : String
    var name : String
    var price : Int
    var slug : String
    var quantity : Int
    var quantityInStock : Int
}
