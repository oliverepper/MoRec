//
//  ContentView.swift
//  MoRec WatchKit Extension
//
//  Created by Oliver Epper on 03.10.20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var recorder = TimedRecorder(startAfter: .seconds(2), recordFor: .seconds(5))

    var body: some View {
        VStack {
            Text("State: \(recorder.state == .idle ? "Idle" : "Recording")")
            Text("Recorded: \(recorder.recordedMotionEvents)")
            Button {
                recorder.start()
            }
            label: {
                Text("Start")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
