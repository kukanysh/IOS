//
//  MonitoredAppsView.swift
//  PanDevMetrics
//
//  Created by Куаныш Спандияр on 02.02.2025.
//
//

import SwiftUI
import AppKit


// Structure to hold application data
struct AppInfo: Identifiable {
    let id = UUID()
    let name: String
    let icon: NSImage
    var timeSpent: TimeInterval // Track time for each app
}

class AppTimeTracker: ObservableObject {
    @Published var appTimes: [String: TimeInterval] = [:]
    private var startTime: Date?
    private var currentApp: String?
    
    init() {
        observeActiveApp()
    }
    
    func observeActiveApp() {
        // Listen to app state changes: activate and deactivate
        NSWorkspace.shared.notificationCenter.addObserver(self,
                                                          selector: #selector(applicationDidBecomeActive(_:)),
                                                          name: NSWorkspace.didActivateApplicationNotification,
                                                          object: nil)
        
        NSWorkspace.shared.notificationCenter.addObserver(self,
                                                          selector: #selector(applicationDidResignActive(_:)),
                                                          name: NSWorkspace.didDeactivateApplicationNotification,
                                                          object: nil)
    }
    
    @objc private func applicationDidBecomeActive(_ notification: Notification) {
        guard let app = notification.userInfo?[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication else { return }
        
        let appName = app.localizedName ?? "Unknown"
        if let currentApp = currentApp, currentApp != appName {
            // If the app switches, record the time for the previous app
            if let startTime = self.startTime {
                let elapsedTime = Date().timeIntervalSince(startTime)
                appTimes[currentApp, default: 0] += elapsedTime
            }
        }
        
        // Start tracking time for the new app
        self.currentApp = appName
        self.startTime = Date()
    }
    
    @objc private func applicationDidResignActive(_ notification: Notification) {
        // When an app goes into the background, stop tracking its time
        if let currentApp = self.currentApp, let startTime = self.startTime {
            let elapsedTime = Date().timeIntervalSince(startTime)
            appTimes[currentApp, default: 0] += elapsedTime
        }
        self.currentApp = nil
        self.startTime = nil
    }
    
    // Convert TimeInterval to HH:mm:ss format
    func formatTime(_ timeInterval: TimeInterval) -> String {
        let hours = Int(timeInterval) / 3600
        let minutes = (Int(timeInterval) % 3600) / 60
        let seconds = Int(timeInterval) % 60
        
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct MonitoredAppsView: View {
    @State private var apps: [AppInfo] = []
    @StateObject private var appTimeTracker = AppTimeTracker()

    var body: some View {
        VStack {
            Text("Opened Applications")
                .font(.headline)

            List(apps) { app in
                HStack {
                    Image(nsImage: app.icon)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                    Text(app.name)
                    
                    Spacer()
                    
                    // Display the formatted time for each app
                    Text(appTimeTracker.formatTime(app.timeSpent))

                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.clear)

            Button("Refresh") {
                listOpenedApps()
            }
            .onChange(of: appTimeTracker.appTimes) { oldTimes, newTimes in
                apps = apps.map { app in
                    var updatedApp = app
                    if let timeSpent = newTimes[app.name] {
                        updatedApp.timeSpent = timeSpent
                    }
                    return updatedApp
                }
            }
            .padding()
        }
        .padding()
        .frame(minWidth: 200, maxWidth: 300, minHeight: 400, maxHeight: 500)
        .onAppear {
            listOpenedApps()

        }

    }

    private func listOpenedApps() {
        let runningApps = NSWorkspace.shared.runningApplications
            .filter { $0.activationPolicy == .regular } // Only user apps
            .compactMap { app -> AppInfo? in
                guard let name = app.localizedName,
                      let url = app.bundleURL else { return nil }
                let icon = NSWorkspace.shared.icon(forFile: url.path)
                return AppInfo(name: name, icon: icon, timeSpent: 0)
            }
        apps = runningApps
    }
}

#Preview {
    MonitoredAppsView()
}

