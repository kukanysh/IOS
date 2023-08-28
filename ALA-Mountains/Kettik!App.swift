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

    var body: some Scene {
        WindowGroup {
            if isOnboardingCompleted {
                MainTabbedView()
            } else {
                OnboardingScreenView(isOnboardingCompleted: $isOnboardingCompleted)
            }
        }
    }
}
