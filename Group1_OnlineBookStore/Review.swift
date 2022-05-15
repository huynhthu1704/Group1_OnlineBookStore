//
//  Review.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation

class Review {
    var username : String
    var content : String?
    var ratingValue : Int
    // MARK: Constructor
    init?(username : String, content : String?, ratingValue : Int) {
        
        guard 0 <= ratingValue && ratingValue <= 5 else {
            return nil
        }
        self.username = username
        self.content = content ?? ""     ; self.ratingValue = ratingValue
    }
}
