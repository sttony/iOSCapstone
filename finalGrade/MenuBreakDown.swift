//
//  MenuBreakDown.swift
//  finalGrade
//
//  Created by Li Tong on 2/28/24.
//

import SwiftUI

struct MenuBreakDown: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Order for Delivery")
                .font(.title)
                .foregroundColor(Color.black)
            HStack{
                Button(action: {
                    
                },
                       label: {
                    Text("Starters")
                }).padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .foregroundColor(.black)
                    .background(Color.gray)
                    .cornerRadius(20)
                   
                Button(action: {
                    
                },
                       label: {
                    Text("Mains")
                })
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .foregroundColor(.black)
                    .background(Color.gray)
                    .cornerRadius(20)
                Button(action: {
                    
                },
                       label: {
                    Text("Desserts")
                })
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .foregroundColor(.black)
                    .background(Color.gray)
                    .cornerRadius(20)
                Button(action: {
                    
                },
                       label: {
                    Text("Drinks")
                })
                .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .foregroundColor(.black)
                    .background(Color.gray)
                    .cornerRadius(20)
                
                
            }
        }
    }
}

#Preview {
    MenuBreakDown()
}
