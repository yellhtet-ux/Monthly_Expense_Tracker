//
//  Utility.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/27/23.
//

import Foundation

class Utility {
    static let shared = Utility()
    
    func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
    
}
