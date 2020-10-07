//
//  BaseRecorder.swift
//  MoRec WatchKit Extension
//
//  Created by Oliver Epper on 03.10.20.
//

import Foundation
import CoreMotion
import os.log

enum RecorderState {
    case idle
    case recording
}

public class BaseRecorder: ObservableObject {
    @Published var recordedMotionEvents = 0
    @Published var samplesPerSecond = 50.0
    @Published var state = RecorderState.idle

    private var motionManager = CMMotionManager()
    private var transmitter = Transmitter()
    private var firstTimestamp: TimeInterval?
    private var memoryBuffer = Array<Motion>()
    
    private lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.qualityOfService = .userInteractive
        return queue
    }()

    public func start() {
        os_log("Start recording in queue: \(self.queue)")
        if !motionManager.isDeviceMotionAvailable {
            os_log("No device motion available")
            return
        }
        self.state = .recording
        motionManager.deviceMotionUpdateInterval = 1.0 / self.samplesPerSecond
        motionManager.startDeviceMotionUpdates(to: self.queue) { (deviceMotion: CMDeviceMotion?, error: Error?) in
            if let dm = deviceMotion {
                self.handle(dm)
            }
        }
    }

    public func stop() {
        os_log("Stop recording")
        if state == .recording {
            motionManager.stopDeviceMotionUpdates()
            self.state = .idle
        }
        logMovement()
    }

    public func reset() {
        os_log("Reset recording")
        self.firstTimestamp = nil
        self.recordedMotionEvents = 0
        self.memoryBuffer.removeAll()
    }

    private func handle(_ deviceMotion: CMDeviceMotion) {
        if firstTimestamp == nil {
            firstTimestamp = deviceMotion.timestamp
        }
        let timediff = deviceMotion.timestamp - firstTimestamp!

        let gravity = Gravity(x: deviceMotion.gravity.x,
                              y: deviceMotion.gravity.y,
                              z: deviceMotion.gravity.z)

        let acceleration = Acceleration(x: deviceMotion.userAcceleration.x,
                                 y: deviceMotion.userAcceleration.y,
                                 z: deviceMotion.userAcceleration.z)

        let motion = Motion(time: timediff, gravity: gravity, acceleration: acceleration)

        os_log("Handle Device Motion for timestamp: %@", String(describing: motion.time))
        memoryBuffer.append(motion)
        DispatchQueue.main.async {
            self.recordedMotionEvents = self.memoryBuffer.count
        }
    }

    private func logMovement() {
        let data = try? JSONEncoder().encode(memoryBuffer)
        if let data = data {
            transmitter.send(data)
            print(String(data: data, encoding: .utf8) ?? "")
        }
    }
}
