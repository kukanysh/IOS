//
//  HomeView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 21.06.2023.
//


import SwiftUI
import UIKit

struct HomeView: View {
    
    var place: Places
    
    var places: [Places] = PlacesList.titles
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(spacing: 15) {
                    
                    HeaderView()
                        .padding(15)
                    
                    BitesView()
                        .padding(0)
                    
                    PlacesView()
                        .padding(0)
                    
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            )}
        
        
      
    }
    
    @ViewBuilder
    func HeaderView()-> some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Welcome!")
                    .font(.title)
                Text("Find your favorite place")
                    .font(.title.bold())
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 65)
                .clipShape(Circle())
            
            
        }
    }
    
    @ViewBuilder
    func BitesView()-> some View {
        VStack(spacing: 10) {
            Text("Bites")
                .font(.title2.bold())
                .position(x: 25, y: 20)
                .padding()
                .multilineTextAlignment(.leading)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(places, id: \.id) {place in
                        HStack(spacing: 10) {
                            ZStack {
                                Circle()
                                    .frame(width: 90)
                                    .foregroundColor(.black)
                                
                                Circle()
                                    .frame(width: 80)
                                    .foregroundColor(.white)
                                
                                Image(place.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 70)
                                    .clipShape(Circle())
                                
                            }
                        }
                    }
                }.padding(.bottom)
                    .position(x: 255, y: 60)

                    .edgesIgnoringSafeArea(.all)
            }        }
    }
    
    @ViewBuilder
    func PlacesView()-> some View {
        VStack(alignment: .leading, spacing: 15){
            HStack(alignment: .center, spacing: 15){
                Image(systemName: "circle.grid.2x2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 17, height: 17)
                    .position(x: 25, y: 10)
                
                Text("Most Popular")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .position(x: -35, y: 10)

                
                NavigationLink("Show All", destination: ShowAllView().toolbarRole(.editor).navigationTitle("Most popular"))
                    .position(x: 95, y: 10)
                    .font(.caption)
                    .foregroundColor(.gray)
                    
                }
                
            ScrollView(.horizontal, showsIndicators: false, content:  {
                HStack(spacing: 20) {
                    NavigationLink(destination: LakesDetailView(place: LakesList.titles.first!).toolbarRole(.editor), label: {
                        
                        ZStack {
                            Image("Kolsay2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 190, height: 250)
                                .cornerRadius(25)
                            
                            HStack {
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white)
                                
                                Text("4.9")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }.background {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 75, height: 55)
                                    .foregroundColor(.teal)
                            }.position(x: 140, y: 50)
                            
                            Text(place.city)
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .position(x: 62, y: 195)
                            
                            Text("Kolsay Lake")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .position(x: 75, y: 220)
                        }
                        
                    }
                ) //Kolsay
                    
                    NavigationLink(destination: CanyonsDetailView(place: CanyonsList.titles.first!).toolbarRole(.editor), label: {
                        
                        ZStack {
                            Image("Charyn")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 190, height: 250)
                                .cornerRadius(25)
                            
                            HStack {
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white)
                                
                                Text("4.5")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }.background {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 75, height: 55)
                                    .foregroundColor(.teal)
                            }.position(x: 140, y: 50)
                            
                            
                            Text(place.city)
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .position(x: 65, y: 195)
                            
                            Text("Charyn Canyon")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .position(x: 95, y: 220)
                        }
                        
                    }
                ) //Charyn
                    
                    NavigationLink(destination: MountainsDetailView(place: PlacesList.titles.first!).toolbarRole(.editor), label: {
                        
                        ZStack {
                            
                            Image("Shymbulak")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 190, height: 250)
                                .cornerRadius(25)
                            
                            HStack {
                                Image(systemName: "star")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white)
                                
                                Text("4.7")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                            }.background {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 75, height: 55)
                                    .foregroundColor(.teal)
                            }.position(x: 140, y: 50)

                            
                            Text(place.city)
                                .font(.headline)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .position(x: 65, y: 195)
                            
                            Text("Shymbulak")
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .position(x: 75, y: 220)
                        }
                        
                    }
                ) //Shymbulak
                    
                }
                .padding(15)
            }
        ).buttonStyle(.plain)
            
        }
    }
    
    @ViewBuilder
    func RecomendationsView()-> some View {
        ZStack {
            
        }
    }
    
}
        

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(place: PlacesList.titles.first!)
        
    }
}
