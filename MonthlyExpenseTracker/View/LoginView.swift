//
//  LoginView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/26/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private  var email : String = ""
    @State private var password : String = ""
    
    private let viewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView{
            ScrollView {
                VStack(spacing: 40) {
                    
                    LoginContentView
                    LoginButtonView
                
                }// Parent VStack
                .padding(25)
            }
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
    
    
    var LoginContentView : some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Email")
                .font(.system(size: 20,weight: .medium))
            
            TextField("Email", text: $email) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            
            
            Text("Password")
                .font(.system(size: 20,weight: .medium))
            
            SecureField("Password",text: $password) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(.horizontal)
            .frame(height: 45)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
        }
    }
    
    var LoginButtonView : some View {
        Button(action: {
            viewModel.userLogin(email, password)
        }, label: {
            Text("Login")
                .font(.headline)
                .frame(width: 250,height: 45)
                .foregroundColor(Color.white)
                .background(Color.orange)
                .cornerRadius(12)
        })
    }
}

#Preview {
    LoginView()
}
