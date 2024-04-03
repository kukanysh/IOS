//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 04.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentTab: String = "Expenses"
    
    var body: some View {
        ZStack {
            TabView(selection: $currentTab){
                HomeView()
                    .tag("Home")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                StatisticsView()
                    .tag("Statistics")
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                        Text("Statistics")
                    }
                
                
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
