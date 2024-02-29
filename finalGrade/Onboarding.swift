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
        NavigationStack(){
            VStack(alignment: .leading){
                LittleLemonLog()
                LittleLemonHero()
                              
                Text("First Name")
                TextField("First Name", text:$firstName)
                    .background(
                        RoundedRectangle(cornerRadius: 2) // Round corners
                            .stroke(Color.gray, lineWidth: 1) // Add border
                    )
                Text("Last Name")
                TextField("Last Name", text:$lastName)
                    .background(
                        RoundedRectangle(cornerRadius: 2) // Round corners
                            .stroke(Color.gray, lineWidth: 1) // Add border
                    )
                Text("Email")
                TextField("Email", text:$email)
                    .background(
                        RoundedRectangle(cornerRadius: 2) // Round corners
                            .stroke(Color.gray, lineWidth: 1) // Add border
                    )
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                Button(action: {
                    if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                        //                    self.errorMessage += "First name can't be empty"
                        invalidForm = true
                        isLoggedIn = false
                    }
                    else {
                        invalidForm = false
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
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
            }.navigationDestination(isPresented: $isLoggedIn) {
                Home(isLoggedIn: $isLoggedIn)
            }.onAppear(){
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
            }
            .padding(10)
        }
    }
}
    
    //#Preview {
    //    Onboarding()
    //}
