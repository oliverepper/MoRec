//
//  ContentView.swift
//  MotionRecorder
//
//  Created by Oliver Epper on 06.10.20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var receiver = Receiver()

    var body: some View {
        VStack {
            Text("Movements...")
            Diagram(motions: $receiver.motions)
            List(receiver.motions, id:\.time) { motion in
                Text(motion.acceleration.x.debugDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
