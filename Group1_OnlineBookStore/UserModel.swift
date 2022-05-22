//
//  BookModel.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-22.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore

class UserModel: ObservableObject {
    
    @Published var users = [User]()
    
    private var db = Firestore.firestore()
    
    func getAllData() {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let id = data["user_id"] as? Int ?? 0
                let fullName = data["fullname"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let phone = data["phone_number"] as? String ?? ""
                let rank = data["rank"] as? String ?? ""
                let role_id = data["role_id"] as? Int ?? -1
                let slug = data["slug"] as? String ?? ""
                return User(id: id, fullName: fullName, pwd: password, phoneNumber: phone, slug: slug, rank: rank, role_id: role_id)
            }
        }
    }
    
    func addUser(user : User) {
        do {
            db.collection("users").addDocument(data: [
                "fullname": user.fullName,
                "password" : user.pwd,
                "phone_number" : user.phoneNumber,
                "rank" : user.rank,
                "role_id" : user.role_id,
                "slug" : user.slug,
                "user_id" : user.id
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func updateUser(user : User) {
        do {
            //db.collection("users").do
            db.collection("users").whereField("user_id", isEqualTo: user.id)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Update fail")
                    } else if querySnapshot!.documents.count != 1 {
                        print("Multiple user found")
                    } else {
                        let document = querySnapshot!.documents.first
                        document!.reference.updateData([
                            "fullname": user.fullName,
                            "password" : user.pwd,
                            "phone_number" : user.phoneNumber,
                            "rank" : user.rank,
                            "role_id" : user.role_id,
                            "slug" : user.slug
                        ])
                    }
            }
            
            
        }
    }
    func deleteUser(userId : Int) {
        do {
            db.collection("users").whereField("user_id", isEqualTo: userId)
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

