//
//  Order.swift
//  Cafe
//
//  Created by Toan Tran Chi on 06/09/2023.
//

import Foundation

struct Order: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var type: String
    var documentID: String?
}

// struct Game: Codable, Identifiable {
//     var id: String = UUID().uuidString
//     var name: String
//     var platform: [String]
//     var genre: [String]
//     var developer: String
//     var rating: [Int]
//     var imageURL: String
//     var userID: String
//     var documentID: String?
// }