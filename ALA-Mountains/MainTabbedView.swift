//
//  ContentView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 21.06.2023.
//
//GoTravel - Kazakhstan! app name

import SwiftUI
import UIKit

enum TabbedItems: Int, CaseIterable {
    case home = 0
    case explore
    case settings
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .explore:
            return "Explore"
        case .settings:
            return "Settings"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "home"
        case .explore:
            return "map"
        case .settings:
            return "gear"
        }
    }
}

struct MainTabbedView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView(place: PlacesList.titles.first!)
                    .tag(0)
                
                ExploreView()
                    .tag(1)
                
                SettingsView()
                    .tag(2)
            }
            
            ZStack {
                HStack(spacing: 80) {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                    .padding(6)
                }
                .frame(width: UIScreen.main.bounds.width, height: 90)
                .background(Color("tabBar").opacity(1))
                .cornerRadius(35)
                
            }.edgesIgnoringSafeArea(.all)
            
        }.edgesIgnoringSafeArea(.all)
        
         
    }
        
}

extension MainTabbedView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack(spacing: 5) {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .white)
                .frame(width: 30, height: 30)
            
            Spacer()
            
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
        

    }
}
