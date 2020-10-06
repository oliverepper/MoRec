//
//  WorkoutManager.swift
//  MotionRecorder WatchKit Extension
//
//  Created by Oliver Epper on 06.10.20.
//

import Foundation
import HealthKit
import os.log
import Combine

final class WorkoutManager: NSObject {
    private let healthStore = HKHealthStore()
    private var session: HKWorkoutSession?
    private var cancellables = Set<AnyCancellable>()
    private var isRunning: Bool? = nil

    private let configuration: HKWorkoutConfiguration = {
        let config = HKWorkoutConfiguration()
        config.activityType = .other
        config.locationType = .unknown
        return config
    }()

    func startWorkout() {
        os_log("Starting workout")
        isRunning = true
        do {
            session = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
        } catch {
            os_log("%@", error.localizedDescription)
        }

        session?.delegate = self
        session?.startActivity(with: Date())
    }

    func endWorkout() {
        os_log("End workout")
        if let _ = isRunning {
            session?.end()
        }
        isRunning = nil
    }
}

extension WorkoutManager: HKWorkoutSessionDelegate {
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        switch toState {
        case .notStarted:
            os_log("Not started")
        case .prepared:
            os_log("Prepared")
        case .running:
            os_log("Running")
        case .paused:
            os_log("Paused")
        case .ended:
            os_log("Ended")
        case .stopped:
            os_log("Stopped")
        default:
            fatalError("Unknown state")
        }
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        os_log("Error: %@", error.localizedDescription)
    }
}
