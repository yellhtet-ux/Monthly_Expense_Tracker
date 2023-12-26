//
//  AccountRegisterViewModel.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/24/23.
//

import Foundation
import Firebase
import FirebaseAuth


class AccountRegisterViewModel {
    private let authManager = AuthManager()
    
    func registerUser (_ email: String,_ password: String,_ name: String,_ phone: String,_ photo: UIImage?) {
        authManager.registerUser(email, password, name, phone, photo)
    }
}
