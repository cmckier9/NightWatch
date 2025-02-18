//
//  NightWatchApp.swift
//  NightWatch
//
//  Created by Christopher McKiernan on 3/18/24.
//

import SwiftUI

@main
struct NightWatchApp: App {
    @StateObject private var nightWatchTasks = NightWatchTasks()
    
    var body: some Scene {
        WindowGroup {
            ContentView(
                nightWatchTasks: nightWatchTasks
            )
        }
    }
}
