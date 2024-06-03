//
//  ALA_MountainsApp.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 21.06.2023.
//

import SwiftUI

@main
struct KettikApp: App {
    
    @State private var isOnboardingCompleted = false
    
    let locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                MainTabbedView()
                    .environmentObject(locationManager)
            } else {
                OnboardingScreenView(isOnboardingCompleted: $isOnboardingCompleted)
                    .environmentObject(locationManager)
            }
        }
    }
}
