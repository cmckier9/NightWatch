//
//  Task.swift
//  NightWatch
//
//  Created by Christopher McKiernan on 3/19/24.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isComplete: Bool
    var lastCompleted: Date?
}
