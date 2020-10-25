//
//  Transmitter.swift
//  MotionRecorder WatchKit Extension
//
//  Created by Oliver Epper on 06.10.20.
//

import Foundation
import WatchConnectivity
import os.log

final class Transmitter: NSObject {
    private var session = WCSession.default

    override init() {
        super.init()
        if (WCSession.isSupported()) {
            session.delegate = self
            session.activate()
        }
    }

    func send(_ jsonData: Data) {
        let data = ["jsonData":jsonData as Any]
        session.sendMessage(data, replyHandler: nil, errorHandler: nil)
    }

    func send(_ text: String) {
        let data = ["message":text as Any]
        session.sendMessage(data, replyHandler: nil) { error in
            os_log("%@", error.localizedDescription)
        }
    }
}

extension Transmitter: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
}
