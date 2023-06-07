//
//  swifttutorialApp.swift
//  swifttutorial
//
//  Created by Куаныш Спандияр on 31.05.2023.
//

import SwiftUI

@main

struct swifttutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
