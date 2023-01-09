//
//  SessionPagingView.swift
//  WorkoutSession WatchKit Extension
//
//  Created by Samantha Chang on 12/20/21.
//

import SwiftUI
import WatchKit
import HealthKit

struct SessionPagingView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .metrics
    
    enum Tab {
        case controls, metrics, motion
    }

    var body: some View {
        TabView(selection: $selection) {
            ControlsView().tag(Tab.controls)
            MetricsView().tag(Tab.metrics)
            MotionView().tag(Tab.motion)
        }
        .navigationTitle("Swimming")
        .onChange(of: workoutManager.running) { _ in
            displayMetricsView()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic))
        .onChange(of: isLuminanceReduced) { _ in
            displayMetricsView()
        }
        .onAppear {
            workoutManager.requestAuthorization()
            workoutManager.startWorkout(workoutType: .walking)
        }
    }

    private func displayMetricsView() {
        withAnimation {
            selection = .metrics
        }
    }
}

struct PagingView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPagingView().environmentObject(WorkoutManager())
    }
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .swimming:
            return "Swimming"
        default:
            return ""
        }
    }
}
