//
//  Task.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/23/21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp? 
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement the UI", completed: true),
    Task(title: "Connect to the Firebase", completed: false),
    Task(title: "???", completed: false),
    Task(title: "Profit!", completed: false)
]
#endif
