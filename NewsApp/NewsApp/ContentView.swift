//
//  ContentView.swift
//  NewsApp
//
//  Created by Куаныш Спандияр on 27.02.2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            TopHeadlinesView(type: "top-headlines")
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Top Headlines")
                }
                
            DiscoverView(type: "everything")
                .tabItem {
                    Image(systemName: "globe")
                    Text("Discover")
                }
            
            Bookmarks()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Bookmarks")
                }
        }
    }
}

#Preview {
    ContentView()
}

