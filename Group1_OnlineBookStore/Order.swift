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
    var total : Int
    var deliveryFee : Int
    var totalPrice : Int
    
    init ( id : String,
     customerId :String,
     orderDate : Date,
     note : String,
     userId : String,
     total : Int,
     deliveryFee : Int,
     totalPrice : Int){
        self.id = id
        self.customerId = customerId
        self.orderDate = orderDate
        self.note = note
        self.userId = userId
        self.total = total
        self.deliveryFee = deliveryFee
        self.totalPrice = totalPrice
    }
}
