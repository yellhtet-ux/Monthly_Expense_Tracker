//
//  LoginViewModel.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/26/23.
//

import Foundation

class LoginViewModel {
    let authManager = AuthManager()
    
    func userLogin (_ email: String,_ password: String) {
        authManager.loginUser(email, password)
    }
}
