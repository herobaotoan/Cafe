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

// class GameViewModel: ObservableObject {
//     @Published var games = [Game]()
//     private var db = Firestore.firestore()
//     init() {
//         getAllGameData()
//     }
//     func getAllGameData() {
//         db.collection("game").addSnapshotListener { (querySnapshot, error) in
//             guard let documents = querySnapshot?.documents else {
//                 print("No documents")
//                 return
//             }
//             self.games = documents.map { (queryDocumentSnapshot) -> Game in
//                 let data = queryDocumentSnapshot.data()
//                 let name = data["name"] as? String ?? ""
//                 let platform = data["platform"] as? [String] ?? [""]
//                 let genre = data["genre"] as? [String] ?? [""]
//                 let developer = data["developer"] as? String ?? ""
//                 let rating = data["rating"] as? [Int] ?? [0]
//                 let imageURL = data["imageURL"] as? String ?? ""
//                 let userID = data["userID"] as? String ?? ""
//                 return Game(name: name, platform: platform, genre: genre, developer: developer, rating: rating, imageURL: imageURL, userID: userID, documentID: queryDocumentSnapshot.documentID)
//             }
//         }
//     }
//     func addNewGameData(name: String, platform: [String], genre: [String], developer: String, rating: [Int], imageURL: String, userID: String) {
//         db.collection("game").addDocument(data: [name: name, platform: platform, genre: genre, developer: developer, rating: rating, imageURL: imageURL, userID: userID])
//     }
    
//     func removeGameData(documentID: String) {
//         db.collection("game").document(documentID).delete { (error) in
//             if let error = error {
//                 print("Error removing document: \(error)")
//             } else {
//                 print("Document successfully removed!")
//             }
//         }
//     }
// }
