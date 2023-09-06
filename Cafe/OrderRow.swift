//
//  OrderRow.swift
//  Cafe
//
//  Created by Toan Tran Chi on 06/09/2023.
//

import SwiftUI

struct OrderRow: View {
    var order: Order
    
    var body: some View {
        HStack{
            Image(order.type)
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("\(order.name)")
                .padding()
        }
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(order: Order(name: "Me", type:"Capuchino"))
    }
}
