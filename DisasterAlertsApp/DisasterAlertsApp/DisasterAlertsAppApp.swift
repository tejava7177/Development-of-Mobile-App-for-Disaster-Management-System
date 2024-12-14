//
//  DisasterAlertsAppApp.swift
//  DisasterAlertsApp
//
//  Created by 심주흔 on 12/14/24.
//

import SwiftUI
import AWSCore
import AWSMobileClient

@main
struct DisasterAlertApp: App {
    init() {
            let credentialsProvider = AWSCognitoCredentialsProvider(
                regionType: .APNortheast2,
                identityPoolId: "ap-northeast-2:86f43546-d587-4c18-9156-d763132e758e"
            )
            let configuration = AWSServiceConfiguration(
                region: .APNortheast2,
                credentialsProvider: credentialsProvider
            )
            AWSServiceManager.default().defaultServiceConfiguration = configuration
            
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
