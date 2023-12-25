//
//  GeneralExpenseView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/29/23.
//

import SwiftUI

struct GeneralExpenseView: View {
    var body: some View {
        VStack {
            GeneralExpenseTitleView()
            Spacer()
            GeneralExpenseCategoryNameView()
            Spacer()
            GeneralExpenseAmountView()
            Spacer()
            GeneralExpenseAddButtonView()
            Spacer()
            Spacer()
            Spacer()
        }
        .padding(.all)
    }
}

struct GeneralExpenseTitleView: View {
    var body: some View {
        HStack {
            Text("General \nExpenses")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
            Spacer()
        }
    }
}

struct GeneralExpenseCategoryNameView: View {
    @State private var categoryName : String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Category Name")
                Spacer()
            }
            TextField("", text: $categoryName)
                .padding(.all)
                .border(.gray)
        }
    }
}

struct GeneralExpenseAmountView: View {
    @State private var amount : String = ""
    var body: some View {
        VStack {
            HStack {
                Text("Amount")
                Spacer()
            }
            TextField("", text: $amount)
                .padding(.all)
                .border(.gray)
        }
    }
}

struct GeneralExpenseAddButtonView: View {
    var body: some View {
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
    }
}

#Preview {
    GeneralExpenseView()
}
