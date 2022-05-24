    //
    //  BookModel.swift
    //  Group1_OnlineBookStore
    //
    //  Created by Pham Van Thanh on 2022-05-22.
    //  Copyright © 2022 Huynh Thu. All rights reserved.
    //
    
    import Foundation
    import FirebaseFirestore
    
    class BookModel: ObservableObject {
        
        @Published var books = [Book]()
        @Published var book : Book?
        
        private var db = Firestore.firestore()
        
        func getAllData(completion : @escaping () -> Void) {
            db.collection("books").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                self.books = documents.map { (queryDocumentSnapshot) -> Book in
                    let data = queryDocumentSnapshot.data()
                    let id = data["book_id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let author = data["author"] as? String ?? ""
                    let category_id = data["category_id"] as? String ?? ""
                    let price = data["price"] as? Int ?? 0
                    let publisher = data["publisher"] as? String ?? ""
                    let quantity = data["quantity"] as? Int ?? 0
                    let summary = data["summary"] as? String ?? ""
                    let slug = data["slug"] as? String ?? ""
                    let totalSold = data["total_sold"] as? Int ?? 0
                    let totalLikes = data["total_likes"] as? Int ?? 0
                    let created_at = data["created_at"] as? String ?? Date().getFormater(format: "MM/dd/yyyy HH:mm")
                    return Book(id: id, name: name, author: author, publisher: publisher, price: price, quantity: quantity, totalSold: totalSold, slug: slug, summary: summary, category: category_id, created_at: created_at.toDate() ?? Date(), totalLikes: totalLikes)
                }
                completion()
            }
        }
        
        func getAllData() {
                  
                   db.collection("books").addSnapshotListener { (querySnapshot, error) in
                       guard let documents = querySnapshot?.documents else {
                           print("No documents")
                           return
                       }
                    self.books = documents.map { (queryDocumentSnapshot) -> Book in
                           let data = queryDocumentSnapshot.data()
                           let id = data["book_id"] as? String ?? ""
                           let name = data["name"] as? String ?? ""
                           let author = data["author"] as? String ?? ""
                           let category_id = data["category_id"] as? String ?? ""
                           let price = data["price"] as? Int ?? 0
                           let publisher = data["publisher"] as? String ?? ""
                           let quantity = data["quantity"] as? Int ?? 0
                           let summary = data["summary"] as? String ?? ""
                           let slug = data["slug"] as? String ?? ""
                           let totalSold = data["total_sold"] as? Int ?? 0
                           let totalLikes = data["total_likes"] as? Int ?? 0
                           let created_at = data["created_at"] as? String ?? Date().getFormater(format: "MM/dd/yyyy HH:mm")
                           
                           return Book(id: id, name: name, author: author, publisher: publisher, price: price, quantity: quantity, totalSold: totalSold, slug: slug, summary: summary, category: category_id, created_at: created_at.toDate() ?? Date(), totalLikes: totalLikes)
                       }
                   }
               }
        func getBookDetail(bookId: String,  completion : @escaping (Book) -> Void) {
            db.collection("books").whereField("book_id", isEqualTo: bookId).getDocuments(completion: { (querySnapshot, error) in
                dump(querySnapshot?.documents)
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                let data = documents.first?.data()
                let id = data!["book_id"] as? String ?? ""
                print("bookdetail\(id)")

                let name = data!["name"] as? String ?? ""
                let author = data!["author"] as? String ?? ""
                let category_id = data!["category_id"] as? String ?? ""
                let price = data!["price"] as? Int ?? 0
                let publisher = data!["publisher"] as? String ?? ""
                let quantity = data!["quantity"] as? Int ?? 0
                let summary = data!["summary"] as? String ?? ""
                let slug = data!["slug"] as? String ?? ""
                let totalSold = data!["total_sold"] as? Int ?? 0
                let totalLikes = data!["total_likes"] as? Int ?? 0
                let created_at = data!["created_at"] as? String ?? Date().getFormater(format: "MM/dd/yyyy HH:mm")
                
                self.book = Book(id: id, name: name, author: author, publisher: publisher, price: price, quantity: quantity, totalSold: totalSold, slug: slug, summary: summary, category: category_id, created_at: created_at.toDate() ?? Date(), totalLikes: totalLikes)
                completion(self.book!)
            })
        }
        
        func addBook(book: Book) {
            do {
                db.collection("users").addDocument(data: [
                    "book_id": book.id,
                    "author": book.author,
                    "category_id":book.category,
                    "name": book.name,
                    "price":book.price,
                    "publisher": book.publisher,
                    "quantity": book.quantity,
                    "slug": "",
                    "summary" : book.summary,
                    "total_likes" : book.totalLikes,
                    "total_sold": book.totalSold,
                    "created_at": book.created_at.getFormater(format: "MM/dd/yyyy HH:mm")
                    
                ])
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        func deleteBook(bookID : String) {
            do {
                db.collection("books").whereField("book_id", isEqualTo: bookID)
                    .getDocuments() { (querySnapshot, err) in
                        if err != nil {
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
        func updateBook(book : Book) {
            do {
                //db.collection("users").do
                db.collection("books").whereField("book_id", isEqualTo: book.id)
                    .getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            print("Update fail")
                        } else if querySnapshot!.documents.count != 1 {
                            print("Multiple book found")
                        } else {
                            let document = querySnapshot!.documents.first
                            document!.reference.updateData([
                                "author": book.author,
                                "category_id": book.category,
                                "name": book.name,
                                "price":book.price,
                                "publisher": book.publisher,
                                "quantity": book.quantity,
                                "slug": "",
                                "summary" : book.summary,
                                "total_likes" : book.totalLikes,
                                "total_sold": book.totalSold
                            ])
                        }
                }
            }
        }
        
    }
