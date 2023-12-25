//
//  ProfileView.swift
//  MonthlyExpenseTracker
//
//  Created by Andrew Hardin on 10/29/23.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack {
            ProfileMainTopView(name: "Lin Htet Ko",email: "linnhtet23@gmail.com",phone: "09342341434")
                .padding(10)
            
            ProfileListView(broughtItemName: "Apple",broughtPersonName: "Kyaw Gyi",broughtDate: "10-11-23")
        }
    }
}

struct ProfileMainTopView : View {
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    
   
    var body: some View {
        HStack (spacing: 10){
            Image("default_profile_img")
                .resizable()
                .frame(width: 100,height: 100)
            
            VStack (alignment: .leading,spacing: 15){
                Text(name)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Text(email)
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                Text(phone)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }
            Spacer()
            
        }
        .padding(10)
        .frame(maxWidth: .infinity,maxHeight: 180)
        .background(Color("profileColor"))
        
    }
}


struct ProfileListView: View {
    @State var broughtItemName: String = ""
    @State var broughtPersonName : String = ""
    @State var broughtDate : String = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach (0..<10,id: \.self) {items in
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
                    .frame(width: 190,height: 90)
                }
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("profileColor"))
    }
}

#Preview {
    ProfileView()
}
