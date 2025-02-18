//
//  DetailsView.swift
//  NightWatch
//
//  Created by Christopher McKiernan on 3/19/24.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task: Task
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "map")
                Text("Placeholder for motel floor plan")
            }
            Text(task.name)
            
            if verticalSizeClass == .regular {
                Divider()
                Text("Placeholder for task description")
            }
            
            Divider()
            Button("Mark complete") {
                task.isComplete = true
            }
        }
    }
}

#Preview {
    DetailsView(
        task: Binding<Task>.constant(
            Task(
                name: "Check all Windows",
                isComplete: false,
                lastCompleted: nil
            )
        )
    )
}
