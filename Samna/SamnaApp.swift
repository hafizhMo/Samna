//
//  SamnaApp.swift
//  Samna
//
//  Created by Hafizh Mo on 27/04/22.
//

import SwiftUI

@main
struct SamnaApp: App {
    @StateObject private var linkController = LinkController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, linkController.container.viewContext)
        }
    }
}
