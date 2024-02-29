//
//  Home.swift
//  finalGrade
//
//  Created by Li Tong on 2/28/24.
//

import SwiftUI

struct Home: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        TabView(){
            Menu()
                .tag(0)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile(isLoggedIn: $isLoggedIn)
                .tag(1)
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
                
        }
        .navigationBarBackButtonHidden(true)
        
    
    }
}

//#Preview {
//    Home()
//}
