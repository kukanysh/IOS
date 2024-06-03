//
//  ContentView.swift
//  Aviata
//
//  Created by Куаныш Спандияр on 28.04.2024.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        
        TabView {
            SearchView(showDate: .now)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "book.pages")
                    Text("Заказы")
                }
            
            TabloView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("Табло")
                }
            
            CabinetView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Кабинет")
                }
            
            OtherView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("Другое")
                }

        }.tint(.color)
    }
}

#Preview {
    ContentView()
}
