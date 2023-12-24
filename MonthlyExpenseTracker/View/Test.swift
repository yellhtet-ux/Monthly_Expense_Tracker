//
//  Test.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 12/24/23.
//

import SwiftUI

struct Test: View {
    
    @State var broughtItemName: String = ""
    @State var broughtPersonName : String = ""
    @State var broughtDate : String = ""
    
    let data = (1...20).map { "Item \($0)" }
    
    var body: some View {
        NavigationView {
                    List {
                        ForEach(0..<data.count, id: \.self) { index in
                            if index % 2 == 0 {
                                HStack {
                                    HStack {
                                        VStack {
                                            Text(broughtItemName)
                                                .font(.system(size: 8))
                                                .fontWeight(.bold)
                                            HStack{
                                                Image("person_icon")
                                                    .resizable()
                                                    .frame(width: 9,height: 9)
                                                    .padding(5)
                                                Text(broughtPersonName)
                                                    .font(.system(size: 8))
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal)
                                            
                                            HStack {
                                                Image("calendar_icon")
                                                    .resizable()
                                                    .frame(width: 9,height: 9)
                                                Text(broughtDate)
                                                    .font(.system(size: 8))
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal)
                                        }
                                        Spacer()
                                        Image("broughtItems_img")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 42,height: 37)
                                    }
                                    .padding()
                                    Spacer()
                                    HStack {
                                        VStack {
                                            Text(broughtItemName)
                                                .font(.system(size: 8))
                                                .fontWeight(.bold)
                                            HStack{
                                                Image("person_icon")
                                                    .resizable()
                                                    .frame(width: 9,height: 9)
                                                    .padding(5)
                                                Text(broughtPersonName)
                                                    .font(.system(size: 8))
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal)
                                            
                                            HStack {
                                                Image("calendar_icon")
                                                    .resizable()
                                                    .frame(width: 9,height: 9)
                                                Text(broughtDate)
                                                    .font(.system(size: 8))
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.horizontal)
                                        }
                                        Spacer()
                                        Image("broughtItems_img")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 42,height: 37)
                                    }
                                    .padding()

                                }
                                .padding(.vertical)
                            }
                        }
                    }
                    .navigationTitle("Two Column List")
                }
            }
    }

#Preview {
    Test()
}
