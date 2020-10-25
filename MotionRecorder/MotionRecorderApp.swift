//
//  MotionRecorderApp.swift
//  MotionRecorder
//
//  Created by Oliver Epper on 06.10.20.
//

import SwiftUI

@main
struct MotionRecorderApp: App {
    var body: some Scene {
        WindowGroup {
            let store = AppStore(appState: AppState(), reduce: reduce)
            let receiver = Receiver(appStore: store)
            ContentView().environmentObject(store).environmentObject(receiver)
        }
    }
}
