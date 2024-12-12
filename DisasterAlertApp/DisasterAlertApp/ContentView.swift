//
//  ContentView.swift
//  DisasterAlertApp
//
//  Created by 심주흔 on 12/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var alertMessage: String = "No message received yet."
    
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

            Button(action: fetchAlert) {
                Text("Fetch Alert")
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

    func fetchAlert() {
        // 여기에 AWS API 호출 코드 추가 예정
        alertMessage = "Test Alert: Flood in Area X."
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
