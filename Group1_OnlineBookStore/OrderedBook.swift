//
//  OrderedBook.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation

class OrderedBook {
    var orderID: String
    var book: Book
    var amount: Int
    var isReview:Bool
    
    init(orderID: String,book:Book, amount: Int) {
        self.orderID = orderID
        self.book = book
        self.amount = amount
        self.isReview = false
    }
    
}
