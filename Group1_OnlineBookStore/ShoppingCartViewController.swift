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
    var booksInShoppingCart = [Book]()
    var books = [Book]()
    
    @IBOutlet weak var totalPrice: UILabel!
    @IBAction func selectAllItem(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        books = SaveData.bookModel.books
        // Get books which are added to shopping cart
        shoppingCartTableView.dataSource = self
        for i in 0..<books.count {
            for j in 0..<shoppingCart.count {
                if shoppingCart[j].bookId == books[i].id {
                    booksInShoppingCart.append(books[i])
                    
                }
            }
        }
    }
    
    //Click on purchase button
    @IBAction func purchase(_ sender: UIButton) {
    }
    
    // Number of row in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCart.count
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
        if let url = URL(string: item.slug) {
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                DispatchQueue.main.async{
                    
                    let img = UIImage(data: data)
                    cell.bookImg.image = img
                }
            })
            task.resume()
        }
        else {
            print("Invalid slug")
        }
        
        cell.bookName.text = item.name
        cell.price.text = String(item.price)
        cell.quantity.text = String(item.quantity)
        return cell
    }
}
