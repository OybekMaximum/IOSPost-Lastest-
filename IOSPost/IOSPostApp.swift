//
//  IOSPostApp.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 11/10/21.
//

import SwiftUI
import Firebase
@main
struct IOSPostApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            StarterScreen()
                .environmentObject(SessionStore())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
