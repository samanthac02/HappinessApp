//
//  MotionView.swift
//  WorkoutSession WatchKit Extension
//
//  Created by Samantha Chang on 12/26/21.
//

import SwiftUI
import CoreMotion

struct MotionView: View {
    let motionManager = CMMotionManager()
    
    var body: some View {
        VStack {
            /*Text("Hello, world!")
                .padding()
                .onAppear {
                    motionManager.startAccelerometerUpdates()
                    motionManager.startGyroUpdates()
                    motionManager.startMagnetometerUpdates()
                    motionManager.startDeviceMotionUpdates()
                }*/
            
            Button(action: {
                motionManager.startAccelerometerUpdates()
                motionManager.startGyroUpdates()
                motionManager.startMagnetometerUpdates()
                motionManager.startDeviceMotionUpdates()
                
                if let accelerometerData = motionManager.accelerometerData {
                    print(accelerometerData)
                }
                if let gyroData = motionManager.gyroData {
                    print(gyroData)
                }
                if let magnetometerData = motionManager.magnetometerData {
                    print(magnetometerData)
                }
                if let deviceMotion = motionManager.deviceMotion {
                    print(deviceMotion)
                }
            }) { Text("Button") }
            .onAppear {
                motionManager.startAccelerometerUpdates()
                motionManager.startGyroUpdates()
                motionManager.startMagnetometerUpdates()
                motionManager.startDeviceMotionUpdates()
            }
        }
    }
}
