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
    var slug : String
    var summary : String
    var category : String
    var created_at: Date
    var totalLikes : Int
    init(id :String,
         name : String,
         author : String,
         publisher : String,
         price : Int,
         quantity : Int,
         totalSold : Int,
         slug : String,
         summary : String,
         category : String,
         created_at: Date,
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
        self.created_at = created_at
    }
    init(){
        self.id = "No id"
        self.name = "No name"
        self.author = "No author"
        self.publisher = "No publisher"
        self.price = -1
        self.quantity = -1
        self.totalSold = -1
        self.slug = ""
        self.summary = "No summary"
        self.category = "No category"
        self.created_at = Date()
        self.totalLikes = -1
    }
}
