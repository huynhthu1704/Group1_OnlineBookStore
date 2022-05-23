//
//  Category.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import UIKit
class Category {
    var id : String
    var name : String
    var img : String
    init(id : String, name : String, img: String) {
        self.id = id
        self.name = name
        self.img = img
    }
}

