//
//  UserViewModel.swift
//  Cafe
//
//  Created by Toan Tran Chi on 13/09/2023.
//

import Foundation
import FirebaseFirestore

class UserViewModel: ObservableObject {
    @Published var user = [User]()
//    var UID: String
    private var db = Firestore.firestore()
//    init() {
//        getAllOrderData(UID: "")
//    }
//    init(UID: String) {
//        self.UID = UID
//        getUserData(UID: self.UID)
//    }
    func getUserData(UID: String) {
        db.collection("user").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.user = documents.map { (queryDocumentSnapshot) -> User in
                var name = ""
                var email = ""
                var imageURL = ""
                if queryDocumentSnapshot.documentID == UID {
                    let data = queryDocumentSnapshot.data()
                    name = data["name"] as? String ?? ""
                    email = data["email"] as? String ?? ""
                    imageURL = data["imageURL"] as? String ?? ""
                }
                return User(name: name, email: email, imageURL: imageURL, documentID: queryDocumentSnapshot.documentID)
            }
        }
    }
    
    func addNewOrderData(name: String, type: String) {
        db.collection("order").addDocument(data: ["name": name, "type": type])
    }
    
    func removeOrderData(documentID: String) {
        db.collection("order").document(documentID).delete { (error) in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
    }

}
