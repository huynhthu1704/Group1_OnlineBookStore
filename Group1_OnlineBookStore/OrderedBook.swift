//
//  OrderedBook.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-17.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation

class OrderedBook {
    var book: Book
    var amount: Int
    
    init(book:Book, amount: Int) {
        self.book = book
        self.amount = amount
    }
    
}
