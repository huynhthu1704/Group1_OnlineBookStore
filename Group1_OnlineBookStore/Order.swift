//
//  Order.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
class Order {
    var id : String
    var customerName : String
    var customerAddress : String
    var customerPhoneNumber : String
    var orderDate : Date
    var note : String
    var userId : String
    var deliveryFee : Int
    var orderedBooks: [OrderedBook]
    var state: String
    
    init ( id : String,
           customerName :String,
           cusAddress: String,
           cusPhoneNumber: String,
           orderDate : Date,
           note : String,
           userId : String,
           deliveryFee : Int, books: [OrderedBook], state: String){
        self.id = id
        self.customerName = customerName
        self.customerAddress = cusAddress
        self.customerPhoneNumber = cusPhoneNumber
        self.orderDate = orderDate
        self.note = note
        self.userId = userId
        self.deliveryFee = deliveryFee
        self.orderedBooks = books
        self.state = state
    }
    
    func getTotal() -> Double {
        var result:Double = 0.0
        for item in self.orderedBooks {
            result += Double((item.book.price * item.amount))
        }
        return result
    }
    
    func getTotalWithFee() -> Double{
        return getTotal() + Double(self.deliveryFee)
    }
}
