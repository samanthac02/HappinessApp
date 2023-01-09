//
//  PhoneViewModel.swift
//  WCTest3
//
//  Created by Samantha Chang on 3/20/21.
//

import SwiftUI
import WatchConnectivity

final class MessageListViewModel: NSObject {

    var session: WCSession

    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
}

extension MessageListViewModel: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print("there is an error")
        } else {
            print("The session has completed activation.")
        }
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
    func sendMessage() {
        let message: [String : Any] = ["isPro" : true]
        session.sendMessage(message, replyHandler: nil, errorHandler: { error in
            print("error")
        })
    }
}
