//
//  Customer.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-14.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation

class Customer {
    var id : String
    var name : String
    var address : String
    var phoneNumber : String
    
    init(id : String,
        name : String,
        address : String,
        phoneNumber : String) {
        self.id = id
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
    }
}
