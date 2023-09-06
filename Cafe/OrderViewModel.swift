//
//  OrderViewModel.swift
//  Cafe
//
//  Created by Toan Tran Chi on 06/09/2023.
//

import Foundation
import FirebaseFirestore

class OrderViewModel: ObservableObject {
    @Published var orders = [Order]()
    private var db = Firestore.firestore()
    init() {
        getAllOrderData()
    }
    func getAllOrderData() {
        db.collection("order").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.orders = documents.map { (queryDocumentSnapshot) -> Order in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let type = data["type"] as? String ?? ""
                return Order(name: name, type: type, documentID: queryDocumentSnapshot.documentID)
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
