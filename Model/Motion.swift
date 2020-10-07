//
//  Motion.swift
//  MoRec WatchKit Extension
//
//  Created by Oliver Epper on 04.10.20.
//

import Foundation

struct Gravity: Codable {
    var x, y, z: Double
}

struct Acceleration: Codable {
    var x, y, z: Double
}

struct Motion: Codable {
    var time: TimeInterval
    var gravity: Gravity
    var acceleration: Acceleration
}
