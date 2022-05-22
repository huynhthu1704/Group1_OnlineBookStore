//
//  User.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import UIKit

class User {
    var id : Int
    var fullName : String
    var pwd : String
    var slug: String
    var rank: String
    var phoneNumber : String
    var role_id : Int
    init(id : Int, fullName : String, pwd : String, phoneNumber : String, slug: String, rank: String, role_id : Int) {
        self.id = id
        self.fullName = fullName
        self.pwd = pwd
        self.phoneNumber = phoneNumber
        self.slug = slug
        self.rank = rank
        self.role_id = role_id
    }
}
