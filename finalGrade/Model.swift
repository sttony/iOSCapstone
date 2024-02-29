//
//  Model.swift
//  finalGrade
//
//  Created by Li Tong on 2/28/24.
//

import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
}


struct MenuItem: Codable, Identifiable {
    let id: Int
    let title: String
    let price: String
    let description: String
    let image: String
} 
