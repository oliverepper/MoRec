//
//  Redux.swift
//  MotionRecorder
//
//  Created by Oliver Epper on 11.10.20.
//

import Foundation

struct AppState {
    var receivedMotions = 0
    var motions = [Motion]()
}

enum Action {
    case increment
    case appendMotion(Motion)
}

func reduce(_ appState: inout AppState, _ action: Action) {
    switch action {
    case .appendMotion(let motion):
        appState.motions.append(motion)
    case .increment:
        appState.receivedMotions += 1
    }
}

typealias reducer = (_ appState: inout AppState, _ action: Action) -> Void

final class AppStore: ObservableObject {
    @Published private(set) var state: AppState
    var reduce: reducer

    init(appState: AppState, reduce: @escaping reducer) {
        self.state = appState
        self.reduce = reduce
    }

    func appendMotion(motion: Motion) {
        DispatchQueue.main.async {
            self.reduce(&self.state, .appendMotion(motion))
            self.reduce(&self.state, .increment)
        }
    }

    func appendMotion(motions: [Motion]) {
        motions.forEach { self.appendMotion(motion: $0) }
    }
}
