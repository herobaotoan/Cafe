//
//  User.swift
//  Cafe
//
//  Created by Toan Tran Chi on 13/09/2023.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var email: String
    var imageURL: String
    var documentID: String?
}
