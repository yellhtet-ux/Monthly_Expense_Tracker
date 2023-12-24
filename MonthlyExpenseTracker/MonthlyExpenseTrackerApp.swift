//
//  MonthlyExpenseTrackerApp.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/21/23.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct MonthlyExpenseTrackerApp: App {
    
    init () {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)

        FirebaseApp.configure()
    
    }
    
    var body: some Scene {
        WindowGroup {
            AccountRegistrationView()
        }
    }
}
