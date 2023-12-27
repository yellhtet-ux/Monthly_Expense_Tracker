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
    @State private var isEmailValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isPhoneValid: Bool = true
    @State private var isAlertShow: Bool = false
    @State private var alertMessage: String = ""
    @State private var selectedImage: UIImage?
    
    private let viewModel = AccountRegisterViewModel()
    private let utility = Utility.shared
    
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
                    RegisterButtonView
                    LoginButtonView
                }
                .alert(isPresented: $isAlertShow) {
                            Alert(
                                title: Text("Validation Error"),
                                message: Text(alertMessage),
                                dismissButton: .default(Text("OK"))
                            )
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
            TextField("", text: $email) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .autocapitalization(.none)
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .onChange(of: email) { newValue in
                isEmailValid = utility.isValidEmail(newValue)
            }
            if !isEmailValid {
                Text("Please enter a valid email address.")
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
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
            .autocapitalization(.none)
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .onChange(of: password) { newValue in
                isPasswordValid = newValue.count >= 6
            }
            if !isPasswordValid {
                Text("Password must be at least 6 characters long.")
                    .foregroundColor(.red)
                    .padding(.top, 4)
            }
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
            .keyboardType(.numberPad)
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .onChange(of: phone ) { newValue in
                isPhoneValid = newValue.count == 11
            }
            
            if !isPhoneValid {
                Text("Please Enter Your Valid Phone Number")
                    .foregroundColor(.red)
                    .padding(.top,4)
            }
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
    
    var RegisterButtonView : some View {
        
        Button(action: {
            if isEmailValid && isPasswordValid {
                viewModel.registerUser(email, password, name, phone, selectedImage)
            }else {
                if !isEmailValid {
                    showAlert("Your Email Format is not correct!")
                }else if !isPasswordValid {
                    showAlert("Your Password must have at least 6 Characters!")
                }else if !isPhoneValid {
                    showAlert("Your Phone Number must be 11 Characters!")
                }
            }
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
    
    func showAlert (_ message: String) {
        self.alertMessage = message
        isAlertShow = true
    }
}

#Preview {
    AccountRegistrationView()
}
