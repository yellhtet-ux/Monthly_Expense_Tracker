//
//  BoughtItemsView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/29/23.
//

import SwiftUI

struct BoughtItemsView: View {
    @State private var boughtItemName : String = ""
    @State private var amount : String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Items that  \nbeing bought")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                Spacer()
            }
            Spacer()
            VStack {
                HStack {
                    Text("Items Name")
                    Spacer()
                }
                TextField("", text: $boughtItemName)
                    .padding(.all)
                    .border(.gray)
            }
            Spacer()
            VStack {
                HStack {
                    Text("Amount")
                    Spacer()
                }
                TextField("", text: $amount)
                    .padding(.all)
                    .border(.gray)
            }
            Spacer()
            Button(action: {
                // Your button action
            }) {
                Text("Add")
                    .foregroundColor(.black)
                    
            }
            .frame(width: 350,height: 45)
            .background(Color.orange)
            .padding(10)
            .cornerRadius(10)
            
            Spacer()
            Spacer()
            Spacer()
        }
        .padding(.all)
    }
}

struct BoughtItemsView_Previews: PreviewProvider {
    static var previews: some View {
        BoughtItemsView()
    }
}
