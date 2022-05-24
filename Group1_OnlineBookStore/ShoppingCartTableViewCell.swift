//
//  ShoppingCartTableViewCell.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-16.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class ShoppingCartTableViewCell: UITableViewCell {
    // Properties
    var vc : ShoppingCartViewController?
    let currentUser : User? = SaveData.userModel.currentUser
    var book : BookInCart? = nil
    @IBOutlet weak var selectBtn: CheckBox!
    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookImg: UIImageView!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBAction func changeQuantity(_ sender: UIStepper) {
        self.quantity.text = String(Int(sender.value))
        let quantity : Int = Int(sender.value)
        if quantity == 0 {
            let alert = UIAlertController(title: "Warning", message: "Do you want to delete this book?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                SaveData.shoppingCartModel.deleteShoppingCart(bookID: self.book!.id, userId: self.currentUser!.id, completion: {})
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
                self.book?.quantity = 1
                self.quantityStepper.value = Double(self.book!.quantity)
                self.quantity.text = String(Int(self.quantityStepper.value))
            }))
            self.vc!.present(alert, animated: true, completion: nil)
            
        } else if quantity == Int(sender.maximumValue) {
            updateQuantity(newQuantity: Int(sender.value))
            
            let alert = UIAlertController(title: "", message: "Sorry we just have \(String(describing: Int(sender.maximumValue))) in the stock", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                
            }))
            self.vc!.present(alert, animated: true)
        } else {
            updateQuantity(newQuantity: Int(sender.value))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func updateQuantity(newQuantity : Int) {
        self.book?.quantity = newQuantity
        SaveData.shoppingCartModel.updateShoppingCart(shoppingCart: ShoppingCart(userId: self.currentUser!.id, bookId: self.book!.id, quantity: self.book!.quantity))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectBtn.isSelected = false
        // Configure the view for the selected state
    }
    func setUp(item : BookInCart) {
        self.quantityStepper.minimumValue = 0
        self.quantityStepper.maximumValue = Double(item.quantityInStock)
        self.quantityStepper.value = Double(item.quantity)
        if let url = URL(string: item.slug) {
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                DispatchQueue.main.async{
                    
                    let img = UIImage(data: data)
                    self.bookImg.image = img
                }
            })
            task.resume()
        }
        else {
            print("Invalid slug")
        }
        
        bookName.text = item.name
        price.text = String(item.price)
        quantity.text = String(item.quantity)
    }
}
