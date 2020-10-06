//
//  Diagram.swift
//  MotionRecorder
//
//  Created by Oliver Epper on 06.10.20.
//

import Foundation
import SwiftUI

struct Diagram: UIViewRepresentable {
    @Binding var motions: [Motion]

    func makeUIView(context: Context) -> DiagramView {
        let view = DiagramView()
        view.backgroundColor = .white
        view.dataArray = motions
        return view
    }
    
    func updateUIView(_ uiView: DiagramView, context: Context) {
        uiView.dataArray = motions
    }
}
