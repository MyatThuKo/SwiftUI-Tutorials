//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Myat Thu Ko on 1/23/21.
//

import SwiftUI
import Firebase

@main
struct To_Do_ListApp: App {
    //Initializer to call the FirebaseApp.configure()
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
