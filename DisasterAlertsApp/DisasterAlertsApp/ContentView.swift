//
//  ContentView.swift
//  DisasterAlertsApp
//
//  Created by 심주흔 on 12/14/24.
//

import SwiftUI
import AWSSNS

struct ContentView: View {
    @State private var alertMessage: String = "No message sent yet."

    var body: some View {
        VStack(spacing: 20) {
            Text("Disaster Alert")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(alertMessage)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            Button(action: sendAlert) {
                Text("Send Alert")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func sendAlert() {
        // SNS 요청 생성
        let request = AWSSNSPublishInput()
        request?.message = "Test Alert: Flood in Area X"
        request?.topicArn = "arn:aws:sns:ap-northeast-2:654654289412:DisasterAlerts" // SNS 주제 ARN 입력

        // SNS 클라이언트 생성 및 메시지 발송
        let snsServiceClient = AWSSNS.default()
        snsServiceClient.publish(request!) { (response, error) in
            if let error = error {
                print("Error sending alert: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    alertMessage = "Failed to send alert: \(error.localizedDescription)"
                }
            } else {
                print("Alert sent successfully.")
                DispatchQueue.main.async {
                    alertMessage = "Alert sent successfully!"
                }
            }
        }
    }
}
