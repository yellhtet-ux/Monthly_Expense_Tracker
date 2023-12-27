//
//  DataManager.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/25/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

class AuthManager : ObservableObject {
    private let id : String = UUID().uuidString
    
    // MARK: - Sign Up
    
    func registerUser (_ email: String,_ password: String,_ name: String,_ phone: String,_ photo: UIImage?) {
        let path = "images/\(id)_img.jpg"
        let storageRef = Storage.storage().reference()
        guard let image = photo else {return}
        let imageOptData = image.jpegData(compressionQuality: 0.8)
        let imageRef = storageRef.child(path)
        if let imageData = imageOptData {
            imageRef.putData(imageData) { metaData, error in
                if let  error = error {
                    print(error.localizedDescription)
                }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error != nil {
                        print(error?.localizedDescription ?? "")
                    }
                }
                
                let db = Firestore.firestore()
                let ref = db.collection("User").addDocument(data: ["name": name,"phone": phone,"photo": path])
                ref.setData(["id": self.id,"name": name,"phone": phone,"photo": path]) {error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
        }   
    }

    // MARK: - Sign In aka Login
    func loginUser (_ email: String,_ password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error!.localizedDescription)
            }else {
                print("Login Success!")
            }
        }
    }
}
