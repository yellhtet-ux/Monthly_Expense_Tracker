//
//  DataManager.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/25/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class DataManager : ObservableObject {

    private var randomID : Int {
        let randomNumber = Int.random(in: 0..<100)
        return randomNumber
    }
    
     func createUser (_ email: String,_ password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
     func addUserData (_ name: String,_ phone: String) {
         let db = Firestore.firestore()
         let ref = db.collection("User").addDocument(data: ["name": name,"phone": phone])
         ref.setData(["id": randomID,"name": name,"phone": phone]) {error in
             if let error = error {
                 print(error.localizedDescription)
             }
         }
    }
}
