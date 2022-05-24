//
//  OrderModel.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class OrderModel: ObservableObject {
    
    @Published var orders = [Order]()
    
    private var orderedBookModel = OrderedBookModel()
    private var db = Firestore.firestore()
    
    init() {
        self.orderedBookModel.getAll()
    }
    
    func getAllOrders() {
        db.collection("orders").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.orders = documents.map { (queryDocumentSnapshot) -> Order in
                let data = queryDocumentSnapshot.data()
                let orderId = data["order_id"] as? String ?? ""
                let address = data["address"] as? String ?? ""
                let cusName = data["customer_name"] as? String ?? ""
                let note = data["note"] as? String ?? ""
                let orderDate = data["order_date"] as? String ?? Date().getFormater(format: "MM/dd/yyyy HH:mm")
                let cusPhoneNumber = data["phone_number"] as? String ?? ""
                let status = data["status"] as? String ?? ""
                let userId = data["user_id"] as? String ?? ""
                let deliveryFee = data["delivery"] as? Int ?? -1
                var orderedBookArray = [OrderedBook]()
                for item in self.orderedBookModel.orderedBooks{
                    if item.orderID == orderId{
                        orderedBookArray.append(item)
                    }
                }
                return Order(id: orderId, customerName: cusName, cusAddress: address, cusPhoneNumber: cusPhoneNumber, orderDate: orderDate.toDate() ?? Date(), note: note, userId: userId, deliveryFee: deliveryFee, books: orderedBookArray, state: status)
            }
        }
    }
    
    func getOrderByUserId(userId: Int) {
        db.collection("orders").whereField("user_id", isEqualTo: userId).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.orders = documents.map { (queryDocumentSnapshot) -> Order in
                let data = queryDocumentSnapshot.data()
                let orderId = data["order_id"] as? String ?? ""
                let address = data["address"] as? String ?? ""
                let cusName = data["customer_name"] as? String ?? ""
                let note = data["note"] as? String ?? ""
                let orderDate = data["order_date"] as? String ?? Date().getFormater(format: "MM/dd/yyyy HH:mm")
                let cusPhoneNumber = data["phone_number"] as? String ?? ""
                let status = data["status"] as? String ?? ""
                let userId = data["user_id"] as? String ?? ""
                let deliveryFee = data["delivery"] as? Int ?? -1
                var orderedBookArray = [OrderedBook]()
                for item in self.orderedBookModel.orderedBooks{
                    if item.orderID == orderId{
                        orderedBookArray.append(item)
                    }
                }
                return Order(id: orderId, customerName: cusName, cusAddress: address, cusPhoneNumber: cusPhoneNumber, orderDate: orderDate.toDate() ?? Date(), note: note, userId: userId, deliveryFee: deliveryFee, books: orderedBookArray, state: status)
            }
        }
//        do {
//            db.collection("orders").whereField("user_id", isEqualTo: userId)
//                .getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Delete fail")
//                    } else if querySnapshot!.documents.count != 1 {
//                        print("")
//                    } else {
//                        if let documents = querySnapshot?.documents{
//                            self.orders = documents.map { (queryDocumentSnapshot) -> Order in
//                                let data = queryDocumentSnapshot.data()
//                                let orderId = data["order_id"] as? String ?? ""
//                                let address = data["address"] as? String ?? ""
//                                let cusName = data["customer_name"] as? String ?? ""
//                                let note = data["note"] as? String ?? ""
//                                let orderDate = data["order_date"] as? String ?? Date().getFormater(format: "MM/dd/yyyy HH:mm")
//                                let cusPhoneNumber = data["phone_number"] as? String ?? ""
//                                let status = data["status"] as? String ?? ""
//                                let userId = data["user_id"] as? String ?? ""
//                                let deliveryFee = data["deliveryFee"] as? Int ?? -1
//                                //get line item orderedBook to add array to order
//                                var orderedBookArray = [OrderedBook]()
//                                for item in self.orderedBookModel.orderedBooks{
//                                    if item.orderID == orderId{
//                                        orderedBookArray.append(item)
//                                    }
//                                }
//                                return Order(id: orderId, customerName: cusName, cusAddress: address, cusPhoneNumber: cusPhoneNumber, orderDate: orderDate.toDate() ?? Date(), note: note, userId: userId, deliveryFee: deliveryFee, books: orderedBookArray, state: status)
//                            }
//                        }
//
//                    }
//            }
//        }
//        catch {
//            print(error.localizedDescription)
//        }
    }
    
    func addOrder(order: Order) {
        //Add line item for order (orderedBook)
        self.orderedBookModel.addOrderedBook(order: order)
        do {
            db.collection("orders").addDocument(data: [
                "address": order.customerAddress,
                "customer_name": order.customerName,
                "delivery": order.deliveryFee,
                "note": order.note,
                "order_date": order.orderDate.getFormater(format: "MM/dd/yyyy HH:mm"),
                "order_id": order.id,
                "phone_number": order.customerPhoneNumber,
                "status": order.state,
                "user_id": order.userId
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func cancelOrder(orderID: String, completion : @escaping (Bool) -> Void) ->Bool {
        var successfulCancel = false
        do {
            //db.collection("users").do
            db.collection("orders").whereField("order_id", isEqualTo: orderID).whereField("status", isEqualTo: "To confirm")
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Update fail")
                    } else if querySnapshot!.documents.count != 1 {
                        print("Multiple book found")
                    } else {
                        let document = querySnapshot!.documents.first
                        document!.reference.updateData([
                            "status": "Cancelled"
                        ])
                        successfulCancel = true
                    }
                    completion(successfulCancel)
            }
        }
       
        return successfulCancel
    }
}
