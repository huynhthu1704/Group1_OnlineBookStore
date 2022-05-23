//
//  Review.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation

class Review {
    var userID : Int
    var bookID : Int
    var content : String?
    var ratingValue : Int
    // MARK: Constructor
    init?(userID : Int, content : String = "", ratingValue : Int, bookID: Int) {
        
        guard 0 <= ratingValue && ratingValue <= 5 else {
            return nil
        }
        self.userID = userID
        self.content = content      
        self.ratingValue = ratingValue
        self.bookID = bookID
        
    }
}
