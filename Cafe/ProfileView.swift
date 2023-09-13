//
//  ProfileView.swift
//  Cafe
//
//  Created by Toan Tran Chi on 13/09/2023.
//

import SwiftUI

struct ProfileView: View {
    @Binding var UID: String
    @StateObject var userViewModel = UserViewModel()
    func show(){
        self.userViewModel.getUserData(UID: UID)
    }
    var body: some View {
        VStack {
            Button{
                show()
            } label: { Text("Refresh") }
            Text("WELCOME!! \(UID)")
            ForEach(userViewModel.user, id: \.id) { user in
                Text(user.name)
                Text(user.email)
                Text(user.imageURL)
            }
        }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
