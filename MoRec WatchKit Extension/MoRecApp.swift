//
//  MoRecApp.swift
//  MoRec WatchKit Extension
//
//  Created by Oliver Epper on 03.10.20.
//

import SwiftUI

@main
struct MoRecApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
