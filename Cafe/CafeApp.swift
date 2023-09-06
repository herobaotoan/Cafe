//
//  CafeApp.swift
//  Cafe
//
//  Created by Toan Tran Chi on 06/09/2023.
//

import SwiftUI
import Firebase

@main
struct CafeApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
