//
//  BookModel.swift
//  Group1_OnlineBookStore
//
//  Created by Pham Van Thanh on 2022-05-22.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class UserModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var currentUser : User?
    @Published var size : Int = 0
    private var db = Firestore.firestore()
    
    func getAllData() {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.size = 0
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let id = data["user_id"] as? Int ?? 0
                let fullName = data["fullname"] as? String ?? ""
                let password = data["password"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let rank = data["rank"] as? String ?? ""
                let role_id = data["role_id"] as? Int ?? -1
                let slug = data["slug"] as? String ?? ""
                self.size += 1
                print(String(self.size))
                return User(id: id, fullName: fullName, pwd: password, email: email, slug: slug, rank: rank, role_id: role_id)
            }
        }
    }
    
    func addUser(user : User) {
        do {
            do {
                db.collection("users").addDocument(data: [
                    "fullname": user.fullName,
                    "password" : user.pwd,
                    "email" : user.email,
                    "rank" : "Member",
                    "role_id" : user.role_id,
                    "slug" : "https://firebasestorage.googleapis.com/v0/b/onlinebookstore-79227.appspot.com/o/users%2Fdefault_user.jpg?alt=media&token=3e65db1e-02f9-4c0c-a51a-107079306796",
                    "user_id" : self.size + 1
                ])
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        func updateUser(user : User) {
            
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
                            "email" : user.email,
                            "rank" : user.rank,
                            "role_id" : user.role_id,
                            "slug" : user.slug
                        ])
                    }
            }
        }
    }
    
    func getCurrentUser() {
        do {
            let email = Auth.auth().currentUser?.email
            //db.collection("users").do
            db.collection("users").whereField("email", isEqualTo: email)
                .getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print(err.localizedDescription)
                    } else if querySnapshot!.documents.count != 1 {
                        print("Multiple user found")
                    } else {
                        let document = querySnapshot!.documents.first
                        let data = document!.data()
                        let id = data["user_id"] as? Int ?? 0
                        let fullName = data["fullname"] as? String ?? ""
                        let password = data["password"] as? String ?? ""
                        let email = data["email"] as? String ?? ""
                        let rank = data["rank"] as? String ?? ""
                        let role_id = data["role_id"] as? Int ?? -1
                        let slug = data["slug"] as? String ?? ""
                        self.currentUser = User(id: id, fullName: fullName , pwd: password, email: email, slug: slug, rank: rank, role_id: role_id)
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
    func slugToImage(slug : String) -> UIImage{
        var img = UIImage()
        if let url = URL(string:slug) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
                guard let data = data, error == nil else{
                    return
                }
                
                DispatchQueue.main.async{
                    
                    let image = UIImage(data: data)
                    img = image!
                }
            })
            task.resume()
        }
        return img
    }
}

