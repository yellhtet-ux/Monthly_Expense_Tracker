//
//  ContentView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Monthly Expenes Tracker")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
