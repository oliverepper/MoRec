//
//  ContentView.swift
//  MotionRecorder
//
//  Created by Oliver Epper on 06.10.20.
//

import SwiftUI

struct LineGraph: Shape {
    var values: [Double]
    var maxValue: Double
    
    func path(in rect: CGRect) -> Path {
        print(maxValue)
        return Path { p in
            guard values.count > 1 else { return }
            p.move(to: CGPoint(x:0, y: rect.height/2))
            p.addLine(to: CGPoint(x: rect.width, y: rect.height/2))
            p.move(to: CGPoint(x: 0, y: CGFloat(maxValue - values[0]) * rect.height/CGFloat(maxValue * 2)))
            for (idx, value) in values.enumerated() {
                let x = rect.width / CGFloat(values.count - 1) * CGFloat(idx)
                let y = CGFloat(maxValue - value) * rect.height/CGFloat(maxValue * 2)
                p.addLine(to: CGPoint(x: x, y: y))
            }
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var store: AppStore

    var body: some View {
        VStack {
            Text("Movements...")
            Text("Received: \(store.state.receivedMotions)")
            let maxValue = store.state.motions.reduce(0.0, { (result, motion) in
                max(result, max(motion.acceleration.x, max(motion.acceleration.y, motion.acceleration.z)))
            })
            let minValue = store.state.motions.reduce(0.0, { (result, motion) in
                min(result, min(motion.acceleration.x, min(motion.acceleration.y, motion.acceleration.z)))
            })
            let bound = max(maxValue, -1 * minValue)
            ZStack(alignment: .center) {
                LineGraph(values: store.state.motions.map { $0.acceleration.x }, maxValue: bound)
                    .stroke(Color.red, lineWidth: 1)
                LineGraph(values: store.state.motions.map { $0.acceleration.y }, maxValue: bound)
                    .stroke(Color.blue, lineWidth: 1)
                LineGraph(values: store.state.motions.map { $0.acceleration.z }, maxValue: bound)
                    .stroke(Color.green, lineWidth: 1)
            }
//            List(store.state.motions, id:\.time) { motion in
//                Text(motion.acceleration.x.debugDescription)
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppStore(appState: AppState(), reduce: reduce))
    }
}
