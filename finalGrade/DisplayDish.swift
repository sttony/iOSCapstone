//
//  DisplayDish.swift
//  finalGrade
//
//  Created by Li Tong on 2/28/24.
//

import SwiftUI

struct DisplayDish: View {
    var dish:Dish
    init(_ dish: Dish){
        self.dish = dish
    }
    var body: some View {
        VStack(alignment: .leading){
            Text(dish.title!)
                .font(.title)
                .foregroundColor(Color(red: 0xf4/255.0, green: 0xce/255.0, blue:0x14/255.0))
            HStack{
                Text(dish.dishDescription!)
                AsyncImage(url: URL(string: dish.image!)) { image in
                    image
                        .resizable(resizingMode: .stretch)
                        .frame(width: 100, height: 100)
                } placeholder: {
                    Image("hero-logo")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 100, height: 100)
                }
                
            }
        }
    }
}

//#Preview {
//    DisplayDish()
//}

