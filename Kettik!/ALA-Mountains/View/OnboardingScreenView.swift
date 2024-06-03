//
//  OnboardingScreenView.swift
//  Kettik!
//
//  Created by Куаныш Спандияр on 28.08.2023.
//

import SwiftUI
import CoreLocationUI

struct OnboardingScreenView: View {
    
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    @Binding var isOnboardingCompleted: Bool
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack {
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    
                    if page == pages.last {
                        Button(action: {
                            goToZero()
                        }, label: {
                            HStack {
                                Text("Get Started!")
                                    .foregroundColor(.white)
                                    .font(.title.bold())
                                    .fontDesign(.rounded)
                                    .fontDesign(.monospaced)
                                
                                
                                    
                                    
                                    
                                
//                                Image(systemName: "arrow.right")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 40, height: 39)
//                                    .foregroundColor(.black)
                                    
                            }
                            .background {
                                Capsule()
                                    .fill(Color("tabBar"))
                                    .frame(width: 240, height: 60)
                                
                        }
                        }).position(x: UIScreen.main.bounds.width/2+5, y: 350)
                        
                            
                
                    } else {
                        Button(action: {
                            incrementPage()
                        }, label: {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 39)
                                .foregroundColor(.white)
                                .background {
                                    Circle()
                                        .fill(Color("tabBar"))
                                        .frame(width: 80, height: 80)
                                    
                                }
                        }).position(x: 350, y: 350)
                        
                        LocationButton(.shareCurrentLocation) {
                            locationManager.requestLocation()
                                
                        }
                        .cornerRadius(25)
                        .symbolVariant(.fill)
                        .foregroundColor(.white)
                        
                        
                        
                        Spacer()
                    }
                    
             
                    
                }.tag(page.tag)
                    .edgesIgnoringSafeArea(.top)
                
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        isOnboardingCompleted = true
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView(isOnboardingCompleted: .constant(false))
    }
}
