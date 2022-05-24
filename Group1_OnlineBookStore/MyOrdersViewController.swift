//
//  MyOrdersViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-18.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var orderedBooks = [OrderedBook]()
    var orders = [Order]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchStackView.setBackgroundColor(.white)
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orders = SaveData.orderModel.orders
        //dump(orders)
        
        dump(orderedBooks)
        //Initializating orderedBooks
        //        let book = Book(id: "1", name: "Xu Xu dung khoc", author: "Pham Van Thanh", publisher: "Ha Noi", price: 11, quantity: 15, totalSold: 14, slug: UIImage(named: "XuXu"), summary: "x", category: "x")
        //        let book1 = Book(id: "2", name: "Green miles", author: "Ngoc Thu", publisher: "Ha Noi", price: 13, quantity: 15, totalSold: 14, slug: UIImage(named: "User's image"), summary: "x", category: "x")
        //        let orderedBook1 = OrderedBook(orderID: "OD15", book: book, amount: 2)
        //        let orderedBook2 = OrderedBook(orderID: "OD16", book: book1, amount: 3)
        //        let orderedBook3 = OrderedBook(orderID: "OD16", book: book1, amount: 3)
        //        let orderedBook4 = OrderedBook(orderID: "OD15", book: book, amount: 2)
        //        orderedBooks.append(orderedBook1)
        //        orderedBooks.append(orderedBook2)
        //        orderedBooks.append(orderedBook3)
        //        orderedBooks.append(orderedBook4)
        //
        //        //Initializating orders
        //        let order1 = Order(id: "OD15", customerId: "Cus1", orderDate: Date(), note: "No note", userId: "x", deliveryFee: 35, books: [orderedBook1, orderedBook4], state: "Cancelled")
        //        let order2 = Order(id: "OD16", customerId: "Cus2", orderDate: Date(), note: "No note", userId: "x", deliveryFee: 0, books: [orderedBook2, orderedBook3], state: "To confirm")
        //        orders.append(order1)
        //        orders.append(order2)
        
    }
    
    
    @IBOutlet weak var orderTableView: UITableView!
    
    @IBOutlet weak var searchStackView: UIStackView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "OrderTableViewCell"
        var cell: OrderTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrderTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrderTableViewCell
        }
        let orderedBook = orderedBooks[indexPath.row]
        for item in orders{
            if orderedBook.orderID == item.id {
                cell.lblState.text = item.state
                break
            }
        }
        if let url = URL(string: orderedBook.book.slug){
            let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                
                DispatchQueue.main.async{
                    
                    let img = UIImage(data: data)
                    cell.imageBook.image = img
                }
            })
            task.resume()
        }
        //        cell.imageBook.image = orderedBook.book.slug
        cell.lblBookName.text = orderedBook.book.name + " - " + orderedBook.book.author
        cell.lblAmountPrice.text = "Amount: \(orderedBook.amount) |  $\(orderedBook.book.price)"
        cell.viewForOrder.layer.borderWidth = 1.5
        cell.viewForOrder.layer.borderColor = UIColor.black.cgColor
        cell.viewForOrder.layer.cornerRadius = 10
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetailView = OrderDetailViewController(nibName: "OrderDetailViewController", bundle: nil)
        //        self.present(viewAllOrdersController, animated: true, completion: nil)
        orderDetailView.orderedBooks = self.orderedBooks
        orderDetailView.orderID = orderedBooks[indexPath.row].orderID
        orderDetailView.navigationItem.title = "Order detail"
        navigationController?.pushViewController(orderDetailView, animated: true)
    }
}
