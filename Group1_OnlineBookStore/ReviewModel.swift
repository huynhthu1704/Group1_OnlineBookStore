//
//  ReviewModel.swift
//  Group1_OnlineBookStore
//
//  Created by Huynh Thu on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ReviewModel: ObservableObject {
    
    @Published var reviews = [Review]()
    
    private var db = Firestore.firestore()
    
    func getAllReview() {
        db.collection("reviews").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.reviews = documents.map { (queryDocumentSnapshot) -> Review in
                let data = queryDocumentSnapshot.data()	
                let bookId = data["book_id"] as? String ?? ""
                let userId = data["user_id"] as? Int ?? -1
                let content = data["content"] as? String ?? ""
                let ratingStar = data["rating_star"] as? Int ?? 0
                print("Star = \(ratingStar)")
                return Review(userID: userId, content: content, ratingValue: ratingStar, bookID: bookId)!
            }
        }
    }
    
    func reviewBook(bookID: String, userID: Int, content: String, ratingStar: Int){
        do {
            //db.collection("users").do
            db.collection("reviews").whereField("book_id", isEqualTo: bookID).whereField("user_id", isEqualTo: userID)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Update fail")
                    } else if querySnapshot!.documents.count != 1 {
                        print("Multiple book found")
                    } else {
                        let document = querySnapshot!.documents.first
                        document!.reference.updateData([
                            "content" : content,
                            "rating_star": ratingStar
                        ])
                    }
            }
        }
    }
    
    func addReview(review: Review) {
        do {
            db.collection("reviews").addDocument(data: [
                "book_id": review.bookID,
                "user_id": review.userID,
                "content": review.content!,
                "rating_star": review.ratingValue,
                
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func addReviewByThanh(bookID: String, userID: Int, content: String, ratingStar: Int) {
        do {
            db.collection("reviews").addDocument(data: [
                "book_id": bookID,
                "user_id": userID,
                "content": content,
                "rating_star": ratingStar,
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteReview(bookID : Int, userId : Int) {
        do {
            db.collection("books").whereField("book_id", isEqualTo: bookID)
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
    
    func getReview(bookID : String) -> [Review]{
        var reviews = [Review]()
        for review in reviews {
            if (review.bookID == bookID) {
                reviews.append(review)
            }
        }
        return reviews
    }
    
    func getReviewByUser(userId : Int) -> [Review]{
        var reviews = [Review]()
        for review in reviews {
            if (review.userID == userId) {
                reviews.append(review)
            }
        }
        return reviews
    }
    
    func getToReviewByUser(userId : Int) -> [Review]{
        var reviews = [Review]()
        for review in reviews {
            if (review.userID == userId && review.ratingValue == 0) {
                reviews.append(review)
            }
        }
        return reviews
    }
    
    func updateReview(review : Review) {
        do {
            //db.collection("users").do
            db.collection("reviews").whereField("book_id", isEqualTo: review.bookID)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Update fail")
                    } else if querySnapshot!.documents.count != 1 {
                        print("Multiple book found")
                    } else {
                        for document in querySnapshot!.documents {
                            let id = document.data()["user_id"] as? Int ?? 0
                            if id == review.userID {
                                document.reference.updateData([
                                    "book_id": review.bookID,
                                    "user_id": review.userID,
                                    "content": review.content,
                                    "rating_star": review.ratingValue,
                                ])
                            }
                        }
                    }
            }
        }
    }
    
}
