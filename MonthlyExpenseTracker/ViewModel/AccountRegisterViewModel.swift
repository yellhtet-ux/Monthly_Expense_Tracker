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
    private let dataManager = DataManager()

    func createUser (_ email: String,_ password: String) {
        dataManager.createUser(email, password)
    }
    
    func addUserData (_ name: String,_ phone: String) {
        dataManager.addUserData(name, phone)
    }
    
    func uploadUserProfileImage (_ photo: UIImage?) {
        dataManager.uploadProfileImage(image: photo)
    }

}
