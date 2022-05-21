//
//  OrderDetailViewController.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-18.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK:Properties
    @IBOutlet weak var booksTableView: UITableView!
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var lblCustomerPhone: UILabel!
    @IBOutlet weak var lblCustomerAddress: UILabel!
    @IBOutlet weak var lblOrderState: UILabel!
    @IBOutlet weak var lblTemporaryPrice: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblTransportFee: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    var hidden:Bool?
    var orderID:String?
    var orders = [Order]()
    var customers = [Customer]()
    var orderedBooks = [OrderedBook]()
    var orderedBooksToShow = [OrderedBook]()
    var orderToShow:Order?
    var customerToShow:Customer?
    let formatDate = "MM/dd/yyyy HH:mm"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let hidden = hidden {
            btnCancel.isHidden = hidden
            let heightConstraint = NSLayoutConstraint(item: contentView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 810)
            contentView.addConstraint(heightConstraint)
        }
        //Initializating orderedBooks
        let book = Book(id: "1", name: "Xu Xu dung khoc", author: "Pham Van Thanh", publisher: "Ha Noi", price: 11, quantity: 15, totalSold: 14, slug: UIImage(named: "XuXu"), summary: "x", category: "x")
        let book1 = Book(id: "2", name: "Green miles", author: "Ngoc Thu", publisher: "Ha Noi", price: 13, quantity: 15, totalSold: 14, slug: UIImage(named: "User's image"), summary: "x", category: "x")
        let orderedBook1 = OrderedBook(orderID: "OD15", book: book, amount: 2)
        let orderedBook2 = OrderedBook(orderID: "OD16", book: book1, amount: 3)
        let orderedBook3 = OrderedBook(orderID: "OD16", book: book1, amount: 3)
        let orderedBook4 = OrderedBook(orderID: "OD15", book: book, amount: 2)
        orderedBooks.append(orderedBook1)
        orderedBooks.append(orderedBook2)
        orderedBooks.append(orderedBook3)
        orderedBooks.append(orderedBook4)
        
        //Initializating customers
        let cus1 = Customer(id: "Cus1", name: "Nguyen Thi Mai Xuan", address: "547, Tan Thach, Chau Thanh, Ben Tren", phoneNumber: "0974422725")
        let cus2 = Customer(id: "Cus1", name: "Pham Van Son", address: "53, Vo Van Ngan, Linh Chieu, Thu Duc", phoneNumber: "0327542028")
        customers.append(cus1)
        customers.append(cus2)
        //Initializating orders
        let order1 = Order(id: "OD15", customerId: "Cus1", orderDate: Date(), note: "No note", userId: "x", deliveryFee: 35, books: [orderedBook1, orderedBook4], state: "Cancelled")
        let order2 = Order(id: "OD16", customerId: "Cus2", orderDate: Date(), note: "No note", userId: "x", deliveryFee: 0, books: [orderedBook2, orderedBook3], state: "To confirm")
        orders.append(order1)
        orders.append(order2)
        
        navigationItem.title = "Order detail"
        //Delegate
        booksTableView.delegate = self
        booksTableView.dataSource = self
        
        //Get orderedBooks To show on detail by orderID
        for item in orderedBooks{
            if item.orderID == self.orderID {
                orderedBooksToShow.append(item)
            }
        }
        for item in orders{
            if item.id == self.orderID{
                orderToShow = item
                break
            }
        }
        
        for item in customers{
            if orderToShow?.customerId == item.id{
                customerToShow = item
                break
            }
        }
        
        
        
        //MARK: Set UI
        lblOrderID.text = "Order ID: \(self.orderID ?? "ID is empty")"
        if let orderToShow = self.orderToShow {
            
            lblOrderDate.text = "Order date: \(orderToShow.orderDate.getFormater(format: self.formatDate))"
            lblOrderState.text = orderToShow.state
            lblTemporaryPrice.text = "$\(orderToShow.getTotal())"
            lblDiscount.text = "$0"
            lblTransportFee.text = "$\(orderToShow.deliveryFee)"
            lblTotalPrice.text = "$\(orderToShow.getTotalWithFee())"
        }
        if let customerToShow = self.customerToShow{
            lblCustomerName.text = customerToShow.name
            lblCustomerPhone.text = customerToShow.phoneNumber
            lblCustomerAddress.text = customerToShow.address
        }
    }
    
    //MARK: Cancel the order
    
    @IBAction func cancelOrder(_ sender: UIButton) {
        if let orderToShow = self.orderToShow {
            switch orderToShow.state {
            case "To confirm":
                let alert = UIAlertController(title: "CANCEL ORDER", message: "Do you want to cancel the order?", preferredStyle: UIAlertController.Style.alert)
                
                        // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: {
                    action in
                    //Go to cancel the order screen
                    let cancelView = CancellingOrderScreenViewController(nibName: "CancellingOrderScreenViewController", bundle: nil)
                    //        self.present(viewAllOrdersController, animated: true, completion: nil)
                    cancelView.navigationItem.title = "Cancel Order"
                    self.navigationController?.pushViewController(cancelView, animated: true)
                }))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            case "Cancelled":
                let alert = UIAlertController(title: "CANCEL ORDER", message: "The order was cancelled!", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            default:
                let alert = UIAlertController(title: "CANCEL ORDER", message: "The order is still delivering!", preferredStyle: UIAlertController.Style.alert)
                
                        // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedBooksToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIndentifier = "OrderedBookTableViewCell"
        var cell: OrderedBookTableViewCell! = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrderedBookTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: "OrderedBookTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIndentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: reuseIndentifier) as? OrderedBookTableViewCell
        }
        let item = orderedBooksToShow[indexPath.row]
        
        cell.imageBook.image = item.book.slug
        cell.lblBookNameAuthor.text = "\(item.book.name) - \(item.book.author)"
        cell.lblBookPrice.text = "$ \(item.book.price)"
        cell.lblQty.text = "Qty: \(item.amount)"
        
        return cell
    }
    
}
extension Date{
    func getFormater(format:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
