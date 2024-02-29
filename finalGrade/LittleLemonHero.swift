//
//  LittleLemonHero.swift
//  finalGrade
//
//  Created by Li Tong on 2/28/24.
//

import SwiftUI

struct LittleLemonHero: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Little lemon")
                .font(.title)
                .foregroundColor(Color(red: 0xf4/255.0, green: 0xce/255.0, blue:0x14/255.0))
            Text("Chicago")
                .font(.title2)
                .foregroundColor(Color.white)
            HStack{
                Text("""
                We are a family owned
                Mediterranean restaurant,
                focused on traditional
                recipes served with a
                modern twist.
                """)
                .foregroundColor(Color.white)
                Image("hero-logo")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 120.0, height: 120.0)
                    
            }
            
        }
        .padding(5)
        .background(Color(red: 0x49/255.0, green: 0x5e/255.0, blue: 0x57/255.0))
    }
}

#Preview {
    LittleLemonHero()
}
