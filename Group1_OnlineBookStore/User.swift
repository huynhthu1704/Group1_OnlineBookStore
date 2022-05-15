//
//  User.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation

class User {
    var id : String
    var fullName : String
    var pwd : String
    var birthday : Date
    init(id : String, fullName : String, pwd : String, birthday : Date) {
        self.id = id
        self.fullName = fullName
        self.pwd = pwd
        self.birthday = birthday
    }
}
