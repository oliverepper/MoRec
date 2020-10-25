//
//  Receiver.swift
//  MotionRecorder
//
//  Created by Oliver Epper on 06.10.20.
//

import Foundation
import WatchConnectivity
import os.log

final class Receiver: NSObject, ObservableObject {
    private var session = WCSession.default
    private var appStore: AppStore

    init(appStore: AppStore) {
        self.appStore = appStore
        super.init()
        if (WCSession.isSupported()) {
            session.delegate = self
            session.activate()
        }
    }
}

extension Receiver: WCSessionDelegate {
    func sessionDidBecomeInactive(_ session: WCSession) {
        os_log("sessionDidDeactivate")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        os_log("sessionDidDeactivate")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        os_log("didReceiveMessage")
        if let jsonData = message["jsonData"] as? Data {
            appStore.appendMotion(motion: try! JSONDecoder().decode(Motion.self, from: jsonData))
        }
    }
}
