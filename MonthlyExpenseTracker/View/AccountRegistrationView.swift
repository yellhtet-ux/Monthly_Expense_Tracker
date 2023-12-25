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
                VStack {
                    NameTextView
                    Spacer()
                    EmailTextView
                    Spacer()
                    PasswordTextView
                    Spacer()
                    PhoneTextView
                    ImageView
                    AddButtonView
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
            TextField("", text: $name) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
                .padding(.all)
                .border(.gray)
        }
    }
    
    var EmailTextView : some View {
        VStack {
            HStack {
                Text("Email")
                Spacer()
            }
            TextField("", text: $email) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
                .padding(.all)
                .border(.gray)
        }
    }
    
    var PasswordTextView : some View {
        VStack {
            HStack {
                Text("Password")
                Spacer()
            }
            SecureField("", text: $password) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
                .padding(.all)
                .border(.gray)
        }
    }
    
    var PhoneTextView : some View {
        VStack {
            HStack {
                Text("Phone")
                Spacer()
            }
            TextField("", text: $phone) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
                .padding(.all)
                .border(.gray)
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
            viewModel.createUser(email, password)
            viewModel.addUserData(name, phone)
            viewModel.uploadUserProfileImage(selectedImage)
        }) {
            Text("Add")
                .foregroundColor(.black)
                .cornerRadius(10)
                .frame(width: 350,height: 45)
                .background(Color.orange)
                .padding(10)
        }
    }
}

#Preview {
    AccountRegistrationView()
}
