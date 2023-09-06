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
