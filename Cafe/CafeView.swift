//
//  CafeView.swift
//  Cafe
//
//  Created by Toan Tran Chi on 06/09/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct CafeView: View {
    @Binding var enable: Bool
    @State var name: String = ""
    @State var type: String = "Capuchino"
    
    @StateObject private var orderViewModel = OrderViewModel()
    func logout(){
        enable = false
    }
    
    func removeOrder(at offsets: IndexSet) {
        for index in offsets {
            if let documentID = orderViewModel.orders[index].documentID {
                orderViewModel.removeOrderData(documentID: documentID)
            }
        }
    }
    
    var body: some View {
        
        VStack{
            Button{
                logout()
            } label: {
                Text("SingOut")
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black.opacity(0.2))
                        .frame(width: 100, height: 50))
            }
            .padding()
            TextField("Enter your name...", text: $name)
                .background(.thinMaterial)
            Text("\(type)")
            HStack{
                Button{
                    type = "Capuchino"
                } label: {
                    Text("Capuchino")
                }
                Button{
                    type = "Expresso"
                } label: {
                    Text("Expresso")
                }
                Button{
                    type = "Dark"
                } label: {
                    Text("Dark")
                }
            }
            .padding()
            Button{
                self.orderViewModel.addNewOrderData(name: name, type: type)
            } label: {
                Text("Order Up!")
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black.opacity(0.2))
                        .frame(width: 100, height: 50))
            }
            
            NavigationView {
                List {
                    ForEach(orderViewModel.orders, id: \.id) { order in
                        OrderRow(order: Order(name: order.name, type: order.type))
                    }
                    .onDelete(perform: removeOrder)
                }
            }

        }
        .frame(width: 300)
    }
}

//struct CafeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeView()
//    }
//}
