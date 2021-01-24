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
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}

// AppDeleagate.swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
