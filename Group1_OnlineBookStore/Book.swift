//
//  Book.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import UIKit
class Book {
    var id : String
    var name : String
    var author : String
    var publisher : String
    var price : Int
    var quantity : Int
    var totalSold : Int
    var slug : UIImage?
    var summary : String
    var category : String
    var totalLikes : Int
    
    init(id :String,
        name : String,
         author : String,
         publisher : String,
         price : Int,
         quantity : Int,
         totalSold : Int,
         slug : UIImage?,
         summary : String,
         category : String,
         totalLikes : Int = 0)    {
        self.id = id
        self.name = name
        self.author = author
        self.publisher = publisher
        self.price = price
        self.quantity = quantity
        self.totalSold = totalSold
        self.slug = slug
        self.summary = summary
        self.category = category
        self.totalLikes = totalLikes
    }
}
