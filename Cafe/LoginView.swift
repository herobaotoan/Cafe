//
//  LoginView.swift
//  Cafe
//
//  Created by Toan Tran Chi on 06/09/2023.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @State var email = ""
    @State var password = ""
    @State var signUpSuccess = false
    @State var loginSuccess = true
    @State var errorMessage = ""
    @State var UID = "LOcALAAmyoYyPN0HgjKN"
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                errorMessage = error?.localizedDescription ?? ""
                loginSuccess = false
            } else {
                errorMessage = "Login success"
                loginSuccess = true
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                errorMessage = error?.localizedDescription ?? ""
                signUpSuccess = false
            } else {
                print("success")
                signUpSuccess = true
            }
        }
    }
    
    var body: some View {
        if !loginSuccess {
            VStack{
                TextField("Email", text:$email)
                    .background(.thinMaterial)
                SecureField("Password", text: $password)
                    .background(.thinMaterial)
                    .padding([.bottom, .trailing], 25)
                HStack{
                    Button {
                        login()
                    } label: {
                        Text("Login")
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.2))
                                .frame(width: 100, height: 50))
                    }
                    .padding([.horizontal, .trailing], 30)
                    Button {
                        signUp()
                    } label: {
                        Text("SignUp")
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.2))
                                .frame(width: 100, height: 50))
                    }
                    .padding([.horizontal, .trailing], 30)
                }
                if signUpSuccess {
                    Text("SignUp Successfully.")
                        .padding()
                } else {
                    Text("\(errorMessage)")
                        .padding()
                }
            }
            .frame(width: 300)
        } else {
//            CafeView(enable: $loginSuccess)
            ProfileView(UID: $UID)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
