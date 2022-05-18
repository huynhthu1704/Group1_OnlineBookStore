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
    var customerId :String
    var orderDate : Date
    var note : String
    var userId : String
    var deliveryFee : Int
    var orderedBooks: [OrderedBook]
    
    init ( id : String,
     customerId :String,
     orderDate : Date,
     note : String,
     userId : String,
     deliveryFee : Int, books: [OrderedBook]){
        self.id = id
        self.customerId = customerId
        self.orderDate = orderDate
        self.note = note
        self.userId = userId
        self.deliveryFee = deliveryFee
        self.orderedBooks = books
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
