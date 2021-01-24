//
//  ContentView.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/23/21.
//

import SwiftUI

struct TaskListView: View {
    let tasks = testDataTasks
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List(tasks) { task in
                    TaskCell(task: task)
                }
                Button(action: {
                    print("Add new task")
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Add New Task")
                    }
                }.padding()
            }
            .navigationTitle("Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    var task: Task
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
            Text(task.title)
        }
    }
}
