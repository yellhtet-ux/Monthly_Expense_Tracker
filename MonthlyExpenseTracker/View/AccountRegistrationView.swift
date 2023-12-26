//
//  ContentView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/21/23.
//

import SwiftUI
import UIKit

struct AccountRegistrationView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    @State private var isImageSelected: Bool = false
    @State private var selectedImage: UIImage?
    
    private let viewModel = AccountRegisterViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    NameTextView
                    Spacer()
                    EmailTextView
                    Spacer()
                    PasswordTextView
                    Spacer()
                    PhoneTextView
                    ImageView
                    AddButtonView
                    LoginButtonView
                }
                .padding(.all)
            }
            .navigationTitle("Account Registration")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    var NameTextView : some View {
        VStack {
            HStack {
                Text("Name")
                Spacer()
            }
            TextField("Name", text: $name) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    var EmailTextView : some View {
        VStack {
            HStack {
                Text("Email")
                Spacer()
            }
            TextField("Email", text: $email) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    var PasswordTextView : some View {
        VStack {
            HStack {
                Text("Password")
                Spacer()
            }
            SecureField("Password", text: $password) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    var PhoneTextView : some View {
        VStack {
            HStack {
                Text("Phone")
                Spacer()
            }
            TextField("Phone", text: $phone) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    var ImageView : some View {
        VStack {
            HStack {
                Text("Photo")
                Spacer()
            }
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture(count: 1, perform: {
                        isImageSelected.toggle()
                    })
                    .sheet(isPresented: $isImageSelected, onDismiss: nil, content: {
                        ImagePicker(selectedImage: $selectedImage, isImageSelected: $isImageSelected)
                    })
            }else {
                Image("photoSelectedIcon")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture(count: 1, perform: {
                        isImageSelected.toggle()
                    })
                    .sheet(isPresented: $isImageSelected, onDismiss: nil, content: {
                        ImagePicker(selectedImage: $selectedImage, isImageSelected: $isImageSelected)
                    })
            }
        }
    }
    
    var AddButtonView : some View {
        Button(action: {
            
            viewModel.registerUser(email, password, name, phone, selectedImage)
        }) {
            Text("Register")
                .padding(10)
                .frame(width: 350,height: 45)
                .foregroundColor(.black)
                .background(Color.orange)
                .cornerRadius(12)
        }
    }
    
    var LoginButtonView: some View {
        NavigationLink {
            LoginView()
        } label: {
            Text("Login")
                .padding(10)
                .frame(width: 350,height: 45)
                .foregroundColor(.black)
                .background(Color.orange)
                .cornerRadius(12)
        }


     
    }
}

#Preview {
    AccountRegistrationView()
}
