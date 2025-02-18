//
//  ContentView.swift
//  NightWatch
//
//  Created by Christopher McKiernan on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var nightWatchTasks: NightWatchTasks
    @State private var focusModeOn = false
    @State private var resetAlertShowing = false
    
    var body: some View {
        NavigationView {
            List {
                Section(
                    header: TaskSectionHeader(
                        symbolSystemName: "moon.stars",
                        headerText: "Nightly Tasks"
                )) {
                    let taskIndices = nightWatchTasks.nightlyTasks.indices
                    let tasks = nightWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    ForEach(taskIndexPairs, id:\.0.id,
                        content: {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.nightlyTasks
                        let theTasksBinding = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination:
                                    DetailsView(task: theTasksBinding),
                                label: {
                                    TaskRow(task: task)
                                }
                            )
                        }
                    })
                    .onDelete(perform: {
                        indexSet in
                        nightWatchTasks.nightlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in nightWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)})
                }
                
                Section(header: TaskSectionHeader(symbolSystemName: "sunset", headerText: "Weekly Tasks")) {
                    let taskIndices = nightWatchTasks.weeklyTasks.indices
                    let tasks = nightWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    ForEach(taskIndexPairs, id:\.0.id,
                        content: {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.weeklyTasks
                        let theTasksBinding = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination:
                                    DetailsView(task: theTasksBinding),
                                label: {
                                    TaskRow(task: task)
                                }
                            )
                        }
                    })
                    .onDelete(perform: {
                        indexSet in
                        nightWatchTasks.weeklyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in nightWatchTasks.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)})
                }
                
                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Tasks")) {
                    let taskIndices = nightWatchTasks.monthlyTasks.indices
                    let tasks = nightWatchTasks.monthlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    ForEach(taskIndexPairs, id:\.0.id,
                        content: {
                        task, taskIndex in
                        let nightWatchTasksWrapper = $nightWatchTasks
                        let tasksBinding = nightWatchTasksWrapper.monthlyTasks
                        let theTasksBinding = tasksBinding[taskIndex]
                        
                        if focusModeOn == false || (focusModeOn && task.isComplete == false) {
                            NavigationLink(
                                destination:
                                    DetailsView(task: theTasksBinding),
                                label: {
                                    TaskRow(task: task)
                                }
                            )
                        }
                    })
                    .onDelete(perform: {
                        indexSet in
                        nightWatchTasks.monthlyTasks.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in nightWatchTasks.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)})
                }
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Reset") {
                        resetAlertShowing = true
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar) {
                    Toggle(isOn: $focusModeOn, label:{ Text("Focus Mode")
                    })
                }
            }
        }.alert(isPresented: $resetAlertShowing,
                content: {
            Alert(
                title: Text("Reset List"),
                message: Text("Are you sure?"),
                primaryButton: .cancel(),
                secondaryButton: .destructive(
                    Text("Yes, reset it"),
                    action: {
                        let refreshedNightWatchTasks = NightWatchTasks()
                        self.nightWatchTasks.nightlyTasks = refreshedNightWatchTasks.nightlyTasks
                        self.nightWatchTasks.weeklyTasks = refreshedNightWatchTasks.weeklyTasks
                        self.nightWatchTasks.monthlyTasks = refreshedNightWatchTasks.monthlyTasks
                    })
            )
        })
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    var body: some View {
        HStack {
            Image(systemName: symbolSystemName)
            VStack {
                Text(headerText)
            }
                
        }
        .font(.title3)
    }
}

let nightWatchTasks = NightWatchTasks()
#Preview {
    ContentView(nightWatchTasks: nightWatchTasks)
}

struct TaskRow: View {
    let task: Task
    
    var body: some View {
        VStack {
            if task.isComplete {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                    .strikethrough()
                }
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}
