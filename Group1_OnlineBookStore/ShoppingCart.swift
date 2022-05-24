//
//  ShoppingCart.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
class ShoppingCart {
    var userId : Int
    var bookId : String
    var quantity : Int
    init(userId : Int, bookId : String, quantity : Int ) {
        self.userId = userId
        self.bookId = bookId
        self.quantity = quantity
    }
}
