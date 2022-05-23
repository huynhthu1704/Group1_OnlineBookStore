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
    init(){
        self.id = "No id"
        self.name = "No name"
        self.author = "No author"
        self.publisher = "No publisher"
        self.price = -1
        self.quantity = -1
        self.totalSold = -1
        self.slug = nil
        self.summary = "No summary"
        self.category = "No category"
        self.totalLikes = -1
    }
}
var books = [
    Book(id: "1", name: "Xu xu dung khoc", author: "Hong Sakura", publisher: "Hoi nha van", price: 120000, quantity: 1, totalSold: 0, slug: UIImage(named: "XuXu")!, summary: "This is a good book, it's really interesting", category: "Fairy tale"),
    Book(id: "2", name: "Tuoi tre dang gia bao nhieu", author: "Rosie Nguyen", publisher: "NXB Ha Noi", price: 120000, quantity: 3, totalSold: 1, slug: UIImage(named: "XuXu")!, summary: "It's really interesting", category: "Self help"),
    Book(id: "1", name: "Xu xu dung khoc", author: "Hong Sakura", publisher: "Hoi nha van", price: 120000, quantity: 1, totalSold: 0, slug: UIImage(named: "XuXu")!, summary: "This is a good book, it's really interesting", category: "Fairy tale"),
       Book(id: "2", name: "Tuoi tre dang gia bao nhieu", author: "Rosie Nguyen", publisher: "NXB Ha Noi", price: 120000, quantity: 3, totalSold: 1, slug: UIImage(named: "XuXu")!, summary: "It's really interesting", category: "Self help"),
       Book(id: "1", name: "Xu xu dung khoc", author: "Hong Sakura", publisher: "Hoi nha van", price: 120000, quantity: 1, totalSold: 0, slug: UIImage(named: "XuXu")!, summary: "This is a good book, it's really interesting", category: "Fairy tale"),
          Book(id: "2", name: "Tuoi tre dang gia bao nhieu", author: "Rosie Nguyen", publisher: "NXB Ha Noi", price: 120000, quantity: 3, totalSold: 1, slug: UIImage(named: "XuXu")!, summary: "It's really interesting", category: "Self help")
]

