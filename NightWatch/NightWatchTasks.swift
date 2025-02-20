//
//  NightWatchTasks.swift
//  NightWatch
//
//  Created by Christopher McKiernan on 3/26/24.
//

import Foundation

class NightWatchTasks: ObservableObject {
    @Published var nightlyTasks = [
        Task(name: "Check all Windows", isComplete: false, lastCompleted: nil),
        Task(name: "Check all doors", isComplete: false, lastCompleted: nil),
        Task(name: "Check that the safe is locked", isComplete: false, lastCompleted: nil),
        Task(name: "Check the mailbox", isComplete: false, lastCompleted: nil),
        Task(name: "Inspect security cameras", isComplete: false, lastCompleted: nil),
        Task(name: "Clear ice from sidewalks", isComplete: false, lastCompleted: nil),
        Task(name: "Document \"strance and unusual\" ocurrences", isComplete: false, lastCompleted: nil),
    ]

    @Published var weeklyTasks = [
        Task(name: "Check inside all vacant rooms", isComplete: false, lastCompleted: nil),
        Task(name: "Walk the perimeter of the property", isComplete: false, lastCompleted: nil),
    ]

    @Published var monthlyTasks = [
        Task(name: "Test security alarm", isComplete: false, lastCompleted: nil),
        Task(name: "Test motion detectors", isComplete: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", isComplete: false, lastCompleted: nil),
    ]
}
