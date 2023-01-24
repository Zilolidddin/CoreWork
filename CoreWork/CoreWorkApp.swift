//
//  CoreWorkApp.swift
//  CoreWork
//
//  Created by Ziloliddin Kamolov on 24/01/23.
//

import SwiftUI

@main
struct CoreWorkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
