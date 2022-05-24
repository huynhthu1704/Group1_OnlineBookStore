//
//  ShoppingCartModel.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ShoppingCartModel: ObservableObject {
    
    @Published var shoppingCart = [ShoppingCart]()
    
    private var db = Firestore.firestore()
    
    func getUserShoppingCart(userId : Int, completion : @escaping () -> Void) {
        db.collection("shopping_cart").whereField("user_id", isEqualTo: userId).getDocuments(completion: {querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Empty shopping cart")
                return
            }
            self.shoppingCart = documents.map { (queryDocumentSnapshot) -> ShoppingCart in
                let data = queryDocumentSnapshot.data()
                let bookId = data["book_id"] as? String ?? ""
                let userId = data["user_id"] as? Int ?? 0
                let quantity = data["quantity"] as? Int ?? 0
                return ShoppingCart(userId: userId, bookId: bookId, quantity : quantity)
            }
            completion()
        })
    }
    
    func addShoppingCart(shoppingCart: ShoppingCart, completion : @escaping () -> Void) {
        do {
            db.collection("shopping_cart").addDocument(data: [
                "book_id": shoppingCart.bookId,
                "user_id": shoppingCart.userId,
                "quantity": shoppingCart.quantity,
            ])
            completion()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteShoppingCart(bookID : String, userId : Int, completion : @escaping () -> Void) {
        do {
            db.collection("shopping_cart").whereField("book_id", isEqualTo: bookID)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Delete fail")
                    } else {
                        let documents = querySnapshot!.documents
                        for document in documents {
                            let id = document.data()["user_id"] as? Int ?? 0
                            if id == userId {
                                document.reference.delete()
                            }
                        }
                    }
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func updateShoppingCart(shoppingCart : ShoppingCart) {
        do {
            db.collection("shopping_cart").whereField("book_id", isEqualTo: shoppingCart.bookId)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Update fail")
                    } else {
                        for document in querySnapshot!.documents {
                            let id = document.data()["user_id"] as? Int ?? 0
                            if id == shoppingCart.userId {
                                document.reference.updateData([
                                    "book_id": shoppingCart.bookId,
                                    "user_id": shoppingCart.userId,
                                    "quantity": shoppingCart.quantity,
                                ])
                            }
                        }
                    }
            }
        }
    }
    
}
