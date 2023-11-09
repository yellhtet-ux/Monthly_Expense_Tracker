//
//  GeneralExpenseView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/29/23.
//

import SwiftUI

struct GeneralExpenseView: View {
    @State private var categoryName : String = ""
    @State private var amount : String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("General \nExpenses")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                Spacer()
            }
            Spacer()
            VStack {
                HStack {
                    Text("Category Name")
                    Spacer()
                }
                TextField("", text: $categoryName)
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

struct GeneralExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralExpenseView()
    }
}
