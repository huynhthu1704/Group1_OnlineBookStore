//
//  OrderedBookModel.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-22.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class OrderedBookModel: ObservableObject {
    
    @Published var orderedBooks = [OrderedBook]()
    
    private var booksModel = BookModel()
    private var db = Firestore.firestore()
    
    //    func getAllData() {
    //        db.collection("books_orders").addSnapshotListener { (querySnapshot, error) in
    //            guard let documents = querySnapshot?.documents else {
    //                print("No documents")
    //                return
    //            }
    //            self.orderedBooks = documents.map { (queryDocumentSnapshot) -> OrderedBook in
    //                let data = queryDocumentSnapshot.data()
    //                let orderId = data["order_id"] as? String ?? ""
    //                let bookid = data["book_id"] as? String ?? ""
    //
    //                return OrderedBook(orderID: orderId, book: <#T##Book#>, amount: <#T##Int#>)
    //            }
    //        }
    //    }
    
    func getOrderedBookByOrderId(orderID: String){
        self.booksModel.getAllData {
            self.db.collection("books_orders").whereField("order_id", isEqualTo: orderID).addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.orderedBooks = documents.map { (queryDocumentSnapshot) -> OrderedBook in
                    let data = queryDocumentSnapshot.data()
                    let orderIDToGet = data["order_id"] as? String ?? ""
                    let bookid = data["book_id"] as? String ?? ""
                    let amount = data["quantity"] as? Int ?? -1
                    var bookOnOrder:Book = Book()
                    for item in self.booksModel.books{
                        if item.id == bookid {
                            bookOnOrder = item
                            break
                        }
                    }
                    return OrderedBook(orderID: orderIDToGet, book: bookOnOrder, amount: amount)
                }
            }
        }
//        do {
//            db.collection("books_orders").whereField("order_id", isEqualTo: orderID)
//                .getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Delete fail")
//                    } else if querySnapshot!.documents.count != 1 {
//                        print("")
//                    } else {
//                        if let documents = querySnapshot?.documents{
//                            self.orderedBooks = documents.map { (queryDocumentSnapshot) -> OrderedBook in
//                                let data = queryDocumentSnapshot.data()
//                                let orderIDToGet = data["order_id"] as? String ?? ""
//                                let bookid = data["book_id"] as? String ?? ""
//                                let amount = data["quantity"] as? Int ?? -1
//                                var bookOnOrder:Book = Book()
//                                for item in self.booksModel.books{
//                                    if item.id == bookid {
//                                        bookOnOrder = item
//                                        break
//                                    }
//                                }
//                                return OrderedBook(orderID: orderIDToGet, book: bookOnOrder, amount: amount)
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
    
    func getAll(){
        self.booksModel.getAllData {
            self.db.collection("books_orders").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.orderedBooks = documents.map { (queryDocumentSnapshot) -> OrderedBook in
                    let data = queryDocumentSnapshot.data()
                    let orderIDToGet = data["order_id"] as? String ?? ""
                    let bookid = data["book_id"] as? String ?? ""
                    let amount = data["quantity"] as? Int ?? -1
                    var bookOnOrder:Book = Book()
                    for item in self.booksModel.books{
                        if item.id == bookid {
                            bookOnOrder = item
                            break
                        }
                    }
                    return OrderedBook(orderID: orderIDToGet, book: bookOnOrder, amount: amount)
                }
            }
        }
//        do {
//            db.collection("books_orders").getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Delete fail")
//                    } else if querySnapshot!.documents.count != 1 {
//                        print("")
//                    } else {
//                        if let documents = querySnapshot?.documents{
//                            self.orderedBooks = documents.map { (queryDocumentSnapshot) -> OrderedBook in
//                                let data = queryDocumentSnapshot.data()
//                                let orderIDToGet = data["order_id"] as? String ?? ""
//                                print(orderIDToGet)
//                                let bookid = data["book_id"] as? String ?? ""
//                                let amount = data["quantity"] as? Int ?? -1
//                                var bookOnOrder:Book = Book()
//                                for item in self.booksModel.books{
//                                    if item.id == bookid {
//                                        bookOnOrder = item
//                                        break
//                                    }
//                                }
//                                return OrderedBook(orderID: orderIDToGet, book: bookOnOrder, amount: amount)
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
    
    func addOrderedBook(order: Order) {
        for item in order.orderedBooks {
            do {
                db.collection("books_orders").addDocument(data: [
                    "book_id": item.book.id,
                    "order_id": order.id,
                    "quantity": item.amount
                ])
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getArrayOrderedBooks(orderIDs: [String]) -> [OrderedBook] {
        var result = [OrderedBook]()
        for id in orderIDs{
            for item in self.orderedBooks{
                if item.orderID == id{
                    result.append(item)
                }
            }
        }
        return result
    }
}
