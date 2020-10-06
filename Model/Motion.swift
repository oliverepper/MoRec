//
//  Motion.swift
//  MoRec WatchKit Extension
//
//  Created by Oliver Epper on 04.10.20.
//

import Foundation

struct Attitude: Codable {
    var roll, pitch, yaw: Double
}

struct RotationRate: Codable {
    var x, y, z: Double
}

struct Gravity: Codable {
    var x, y, z: Double
}

struct Acceleration: Codable {
    var x, y, z: Double
}

struct Motion: Codable {
    var time: TimeInterval
    var attitude: Attitude
    var rotationRate: RotationRate
    var gravity: Gravity
    var acceleration: Acceleration
}
