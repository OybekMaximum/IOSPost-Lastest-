//
//  IOSPostApp.swift
//  IOSPost
//
//  Created by Oybek To’laboyev on 11/10/21.
//

import SwiftUI

@main
struct IOSPostApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
