//
//  ContentView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 21.06.2023.
//

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
    
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                
                if let location = locationManager.location {
                    if let weather = weather {
                        HomeView(weather: previewWeather, place: PlacesList.titles.first!)
                            .tag(0)
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                } catch {
                                    print("Error getting weather: \(error)")
                                }
                            }
                    }
                } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        HomeView(weather: previewWeather, place: PlacesList.titles.first!)
                            .tag(0)
                            .environmentObject(locationManager)
                    }
                }
                

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
