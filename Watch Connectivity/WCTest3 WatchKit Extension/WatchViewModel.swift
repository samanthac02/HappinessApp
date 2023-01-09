//
//  WatchViewModel.swift
//  WCTest3 WatchKit Extension
//
//  Created by Samantha Chang on 3/20/21.
//

import WatchConnectivity

final class AnimalListViewModel: NSObject {
    var session: WCSession

    init(session: WCSession  = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension AnimalListViewModel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("error error")
        } else {
            print("The session has completed activation.")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("🐙: \(message)")
    }
}

