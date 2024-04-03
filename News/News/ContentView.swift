//
//  ContentView.swift
//  News
//
//  Created by Куаныш Спандияр on 02.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            DiscoverView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Discover")
                }
            
            SavedView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
