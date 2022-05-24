//
//  CancelReasonModel.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-24.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class CancelReasonModel: ObservableObject {
    
    private var db = Firestore.firestore()
    
    
    func addCancelReason(orderID: String, mainReason: String, detailedReason: String, dateToCancelOrder: String) {
        do {
            db.collection("cancel_reason").addDocument(data: [
                "order_id": orderID,
                "main_reason": mainReason,
                "detail_reason": detailedReason,
                "date_cancel_order": dateToCancelOrder
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}
