//
//  TaskListViewModel.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/23/21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModel = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModel = testDataTasks.map { task in
            TaskCellViewModel(task: task)
        }
    }
}
