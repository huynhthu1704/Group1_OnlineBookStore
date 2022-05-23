//
//  Extension.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation

extension String{
    func toDate() -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        return dateFormatter.date(from: self)
    }
}
