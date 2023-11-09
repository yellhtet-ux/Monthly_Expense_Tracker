//
//  ContentView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/21/23.
//

import SwiftUI

struct AccountRegistrationView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var isImageSelected: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Account \nRegistration")
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    Spacer()
                }
                Spacer()
                VStack {
                    HStack {
                        Text("Name")
                        Spacer()
                    }
                    TextField("", text: $name)
                        .padding(.all)
                        .border(.gray)
                }
                Spacer()
                
                
                VStack {
                    HStack {
                        Text("Email")
                        Spacer()
                    }
                    TextField("", text: $email)
                        .padding(.all)
                        .border(.gray)
                }
                
                Spacer()
                
                
                VStack {
                    HStack {
                        Text("Phone")
                        Spacer()
                    }
                    TextField("", text: $phone)
                        .padding(.all)
                        .border(.gray)
                }
                
                
                Spacer()
                VStack {
                    HStack {
                        Text("Photo")
                        Spacer()
                    }
                    Image("photoSelectedIcon")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                }
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
            .padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRegistrationView()
    }
}
