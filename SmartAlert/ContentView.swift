//
// ContentView.swift
// SmartAlert

//Created by Avery Yang on 1/26/25.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            
            Button("Request Notification Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
                    if let error {
                        print(error.localizedDescription)
                    }
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Car Honk Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Alert"
                content.body = "Car Honk Detected"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let id = UUID().uuidString
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
