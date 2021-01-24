//
//  Task.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/23/21.
//

import Foundation

struct Task: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement the UI", completed: true),
    Task(title: "Connect to the Firebase", completed: false),
    Task(title: "???", completed: false),
    Task(title: "Profit!", completed: false)
]
#endif
