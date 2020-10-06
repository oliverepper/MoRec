//
//  ContentView.swift
//  MotionRecorder WatchKit Extension
//
//  Created by Oliver Epper on 06.10.20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var recorder = TimedRecorder(startAfter: .seconds(2), recordFor: .seconds(5))
    
    var body: some View {
        Button {
            recorder.start()
        }
        label: {
            Text("Start")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
