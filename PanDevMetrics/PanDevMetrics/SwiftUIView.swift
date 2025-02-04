import SwiftUI
import AppKit

class ActiveAppTracker: ObservableObject {
    @Published var activeAppName: String = ""
    @Published var timeSpent: TimeInterval = 0.0
    private var timer: Timer?
    private var lastAppName: String = ""
    private var lastTime: TimeInterval = 0.0
    private var lastUpdateTime: Date = Date()
    private var appTimeTracker: [String: TimeInterval] = [:]
    
    init() {
        setupWorkspaceNotifications()
        startTracking()
    }
    
    func startTracking() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateActiveAppInfo()
        }
    }
    
    private func updateActiveAppInfo() {
        guard let activeApp = NSWorkspace.shared.frontmostApplication,
              let appName = activeApp.localizedName else { return }
        
        let currentTime = Date()
        let elapsedTime = currentTime.timeIntervalSince(lastUpdateTime)
        lastUpdateTime = currentTime
        
        if appName != self.lastAppName {
            // Save the time for the previous app
            if !self.lastAppName.isEmpty {
                appTimeTracker[self.lastAppName] = self.lastTime
            }
            
            // Update to new app
            self.lastAppName = appName
            self.activeAppName = appName
            self.lastTime = appTimeTracker[appName] ?? 0
        } else {
            // Only increment time if a reasonable amount of time has passed
            if elapsedTime < 2.0 { // Guard against large time jumps
                self.lastTime += elapsedTime
            }
        }
        
        // Update the current app's time
        appTimeTracker[appName] = self.lastTime
        self.timeSpent = self.lastTime
    }
    
    private func setupWorkspaceNotifications() {
        NSWorkspace.shared.notificationCenter.addObserver(
            forName: NSWorkspace.didActivateApplicationNotification,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            if let app = notification.userInfo?[NSWorkspace.applicationUserInfoKey] as? NSRunningApplication,
               let appName = app.localizedName {
                self?.activeAppName = appName
                // Reset the last update time when switching apps
                self?.lastUpdateTime = Date()
            }
        }
    }
    
    deinit {
        if !lastAppName.isEmpty {
            appTimeTracker[lastAppName] = lastTime
        }
        timer?.invalidate()
        NSWorkspace.shared.notificationCenter.removeObserver(self)
    }
}

struct CView: View {
    @StateObject private var tracker = ActiveAppTracker()
    
    var body: some View {
        VStack {
            Text("Active App: \(tracker.activeAppName)")
            Text("Time Spent: \(Int(tracker.timeSpent)) seconds")
        }
        .frame(width: 200, height: 100)
        .padding()
    }
}

#Preview {
    CView()
}
