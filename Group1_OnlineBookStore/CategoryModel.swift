//
//  CategoryModel.swift
//  Group1_OnlineBookStore
//
//  Created by VoYen on 2022-05-23.
//  Copyright © 2022 Huynh Thu. All rights reserved.
//

import Foundation
import FirebaseFirestore
class CategoryModel: ObservableObject {
    @Published var categories = [Category]()
    private var db = Firestore.firestore()
    func getAllData() {
        db.collection("categories").addSnapshotListener {
            (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("no documents")
                return
            }
            self.categories = documents.map {
                (queryDocumentSnapshot) -> Category in
                let data = queryDocumentSnapshot.data()
                let id = data["category_id"] as? String ?? ""
                let name = data["name"] as? String ?? ""
                let slug = data["slug"] as? String ?? ""
                return Category(id: id, name: name, img: slug)
            }
            
        }
    }
    func  addCategoy(category : Category)  {
        do {
            db.collection("categories").addDocument(data: [
                "id": category.id,
                "name" : category.name,
                "slug" : category.img,
                
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func delete(categoryId : String) {
        do {
            db.collection("categories").whereField("category_id", isEqualTo: categoryId).getDocuments(){
            (querySnapshot, err) in
            if let err = err {
                print("fail")
                
            } else if querySnapshot!.documents.count != 1 {
                print("f")
            }else{
                let document = querySnapshot!.documents.first
                document!.reference.delete()
                }
            }
            
        }catch {
            print(error.localizedDescription)
        }
    }
}
