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
    var img : UIImage?
    init(id : String, name : String, img: UIImage?) {
        self.id = id
        self.name = name
        self.img = img
    }
}
let categories : [Category] = [
    Category(id: "1", name: "Fairy tale", img: UIImage(named: "XuXu")),
     Category(id: "2", name: "Self help", img: UIImage(named: "XuXu")),
     Category(id: "3", name: "English book", img: UIImage(named: "XuXu")),

]
