//
//  UserProfile.swift
//  finalGrade
//
//  Created by Li Tong on 2/28/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "";
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? "" ;
    let email = UserDefaults.standard.string(forKey: kEmail) ?? "";
    var body: some View {
        VStack{
            Text("Personal information")
            Image("profile-image-placeholder")
            Text(firstName)
            Text(lastName)
            Text(email)
            Button(action: {
                
            }, label: {
                Text("Logout")
            }).padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.top, 10)
        }
    }
}

#Preview {
    UserProfile()
}
