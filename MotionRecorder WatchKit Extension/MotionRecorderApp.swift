//
//  MotionRecorderApp.swift
//  MotionRecorder WatchKit Extension
//
//  Created by Oliver Epper on 06.10.20.
//

import SwiftUI

@main
struct MotionRecorderApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
