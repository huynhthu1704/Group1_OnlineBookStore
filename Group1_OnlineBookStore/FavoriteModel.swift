//
//  FavoriteModel.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FavoriteModel: ObservableObject {
    
    @Published var books = [Book]()
    private var booksModel = BookModel()
    private var db = Firestore.firestore()
    
    init() {
        self.booksModel.getAllData()
    }
    
    func getOrderedBookByOrderId(userID: Int){
//        do {
//            db.collection("favourites_book")
//                .getDocuments() { (querySnapshot, err) in
//                    if let err = err {
//                        print("Get fail")
//                    } else if querySnapshot!.documents.count != 1 {
//                        print("")
//                    } else {
//                        if let documents = querySnapshot?.documents{
//                            self.books = documents.map { (queryDocumentSnapshot) -> Book in
//                                let data = queryDocumentSnapshot.data()
//                                let bookid = data["book_id"] as? String ?? ""
//                                var bookOnFavorite:Book = Book()
//                                for item in self.booksModel.books{
//                                    if item.id == bookid {
//                                        bookOnFavorite = item
//                                        break
//                                    }
//                                }
//                                return bookOnFavorite
//                            }
//                        }
//
//                    }
//            }
//        }
//        catch {
//            print(error.localizedDescription)
//        }
        print("start")
        db.collection("favourites_book").whereField("user_id", isEqualTo: userID).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
              print("exist")
            self.books = documents.map { (queryDocumentSnapshot) -> Book in
                let data = queryDocumentSnapshot.data()
                let bookid = data["book_id"] as? String ?? ""
                print("bookid\(bookid)")
                var bookOnFavorite:Book = Book()
                for item in self.booksModel.books{
                    if item.id == bookid {
                        bookOnFavorite = item
                        break
                    }
                }
                return bookOnFavorite
            }
        }
    }
    
    func addFavoriteBookForUser(userID: Int, bookID: String) {
        do {
            db.collection("favourites_book").addDocument(data: [
                "book_id": bookID,
                "user_id": userID,
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteFavoriteBook(userID: Int, bookID : String) {
        do {
            db.collection("favourites_book").whereField("book_id", isEqualTo: bookID).whereField("user_id", isEqualTo: userID)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Delete fail")
                    } else if querySnapshot!.documents.count != 1 {
                        print("")
                    } else {
                        let document = querySnapshot!.documents.first
                        document!.reference.delete()
                    }
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
