//
//  MetricsView.swift
//  WorkoutSession WatchKit Extension
//
//  Created by Samantha Chang on 12/20/21.
//

import SwiftUI
import HealthKit

struct MetricsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var viewModel = AnimalListViewModel()
    @State var timerCount = 0
    
    var body: some View {
        TimelineView(MetricsTimelineSchedule(from: workoutManager.builder?.startDate ?? Date())) { context in
            VStack(alignment: .leading) {
                ElapsedTimeView(elapsedTime: workoutManager.builder?.elapsedTime ?? 0, showSubseconds: context.cadence == .live)
                    .foregroundStyle(.yellow)
                Text(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
                
                
                
                Button {
                    //print("jello")
                    self.sendMessageData()
                } label: { (Text("\(timerCount)")) }

            }
            .font(.system(.title, design: .rounded).monospacedDigit().lowercaseSmallCaps())
            .frame(maxWidth: .infinity, alignment: .leading)
            .ignoresSafeArea(edges: .bottom)
            .scenePadding()
        }.onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { timer in
                //print("Timer fired!")
                timerCount += 1
                self.sendMessageData()
            }
        }
    }
    
    func sendMessageData() {
        let animal = AnimalModel(name: "\(workoutManager.heartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")", emoji: "❤️")
        guard let data = try? JSONEncoder().encode(animal) else {
            return
        }
        self.viewModel.session.sendMessageData(data, replyHandler: nil) { (error) in
            print(error.localizedDescription)
        }
    }
}

struct MetricsView_Previews: PreviewProvider {
    static var previews: some View {
        MetricsView().environmentObject(WorkoutManager())
    }
}

private struct MetricsTimelineSchedule: TimelineSchedule {
    var startDate: Date

    init(from startDate: Date) {
        self.startDate = startDate
    }

    func entries(from startDate: Date, mode: TimelineScheduleMode) -> PeriodicTimelineSchedule.Entries {
        PeriodicTimelineSchedule(from: self.startDate, by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
            .entries(from: startDate, mode: mode)
    }
}

struct AnimalModel: Codable, Hashable {
    var name: String
    var emoji: String
}
