//
//  TaskRepository.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/24/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("tasks")
            .order(by: "createdTime")
            .whereField("userId", isEqualTo: Auth.auth().currentUser?.uid)
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do {
                        let task = try document.data(as: Task.self)
                        return task
                    }
                    catch {
                        fatalError("Unable to read data: \(error.localizedDescription)")
                    }
                    return nil
                }
            }
        }
    }
    
    func addTask(_ task: Task) {
        do {
            var userTask = task
            userTask.userId = Auth.auth().currentUser?.uid
            let _ = try db.collection("tasks").addDocument(from: userTask)
        }
        catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateTask(_ task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("tasks").document(taskID).setData(from: task)
            }
            catch {
                fatalError("Unable to update task: \(error.localizedDescription)")
            }
        }
    }
}
