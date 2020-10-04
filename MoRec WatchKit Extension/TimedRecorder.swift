//
//  ProgrammableRecorder.swift
//  MoRec WatchKit Extension
//
//  Created by Oliver Epper on 04.10.20.
//

import Foundation
import os.log

public final class TimedRecorder: BaseRecorder {
    private var startAfter, stopAfter: DispatchTimeInterval

    init(startAfter: DispatchTimeInterval, recordFor: DispatchTimeInterval) {
        self.startAfter = startAfter
        self.stopAfter = recordFor
        super.init()
    }

    public override func start() {
        self.reset()
        os_log("Dispatching start in \(String(describing: self.startAfter))")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + startAfter) {
            super.start()
            print(self.state)
            if self.state == .recording {
                os_log("Dispatching stop in \(String(describing: self.stopAfter))")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + self.stopAfter) {
                    self.stop()
                }
            }
        }
    }
}
