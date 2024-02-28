//
//  Onboarding.swift
//  finalGrade
//
//  Created by Li Tong on 2/27/24.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var isLoggedIn = false;
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var invalidForm = true
    var errorMessage = ""
    var body: some View {
        NavigationView(){
            VStack{
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                TextField("First Name", text:$firstName)
                TextField("Last Name", text:$lastName)
                TextField("Email", text:$email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                Button(action: {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        //                    self.errorMessage += "First name can't be empty"
                        invalidForm = true
                    }
                    else {
                        invalidForm = false
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        
                    }
                }, label: {
                    Text("Register")
                }).padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(.top, 10)
//                    .alert("ERROR", isPresented:$invalidForm, actions: {
//                        Button("OK", role: .cancel) { }
//                    }, message: {
//                        Text(self.errorMessage)
//                    })
            }
        }.onAppear(){
            
        }
    }
}

#Preview {
    Onboarding()
}
