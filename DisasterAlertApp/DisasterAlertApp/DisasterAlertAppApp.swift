//
//  DisasterAlertAppApp.swift
//  DisasterAlertApp
//
//  Created by 심주흔 on 12/13/24.
//

import AWSMobileClient

@main
struct DisasterAlertApp: App {
    init() {
        AWSMobileClient.default().initialize { (userState, error) in
            if let error = error {
                print("AWSMobileClient Initialization Error: \(error.localizedDescription)")
            } else {
                print("AWSMobileClient Initialized: \(userState?.rawValue ?? "unknown")")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

