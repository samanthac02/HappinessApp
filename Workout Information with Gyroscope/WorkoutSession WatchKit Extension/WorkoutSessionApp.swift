//
//  WorkoutSessionApp.swift
//  WorkoutSession WatchKit Extension
//
//  Created by Samantha Chang on 12/20/21.
//

import SwiftUI

@main
struct WorkoutSessionApp: App {
    @StateObject private var workoutManager = WorkoutManager()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                SessionPagingView()
            }
            .environmentObject(workoutManager)
        }
    }
}
