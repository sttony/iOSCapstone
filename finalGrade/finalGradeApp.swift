//
//  finalGradeApp.swift
//  finalGrade
//
//  Created by Li Tong on 2/27/24.
//

import SwiftUI

@main
struct finalGradeApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            Menu()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
