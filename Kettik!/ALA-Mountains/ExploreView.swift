//
//  ExploreView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 27.06.2023.
//

import SwiftUI

struct ExploreView: View {
    
    var places: [Places] = PlacesList.titles
    
    var lakes: [Lakes] = LakesList.titles
    
    var canyons: [Canyons] = CanyonsList.titles
    
    @State var searchText: String = ""
    
    @State private var isLiked = false
    
    var filteredPlaces: [Places] {
        guard !searchText.isEmpty else { return places}
        return places.filter { $0.title.localizedCaseInsensitiveContains(searchText)}
    }
    
    var filteredLakes: [Lakes] {
        guard !searchText.isEmpty else { return lakes }
        return lakes.filter { $0.title.localizedCaseInsensitiveContains(searchText)}
    }
    
    var filteredCanyons: [Canyons] {
        guard !searchText.isEmpty else { return canyons }
        return canyons.filter { $0.title.localizedCaseInsensitiveContains(searchText)}
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    HeadView()
                    
                    SearchView()
                    
                    DataView()
                        .padding(0)
                }
            }
        }
    }
    
    @ViewBuilder
    func HeadView()-> some View {
        VStack {
            HStack {
                Text("Explore places")
                    .font(.title.bold())
                    .padding(.top)
                    .padding(.trailing, 200)
            }
            
        }
    }
    
    @ViewBuilder
    func SearchView()-> some View {
        HStack(spacing: 15) {
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding(.leading)
                    .foregroundColor(.black)
                
                Divider()
                    .padding(.vertical, -6)
                
                TextField("Search", text: $searchText)
                    .foregroundColor(.black)
                //                .overlay(
                //                    Image(systemName: "x.circle.fill")
                //                        .foregroundColor(.black),
                //                    in: padding(.trailing))
                
            }
            .padding(15)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.white)
                    .shadow(radius: 1.5)
                    .padding([.leading, .trailing], 19)
                
            }
        }
        .padding(.top, 15)
    }
    
    @ViewBuilder
    func DataView()-> some View {
        ZStack {
            // Using LazyVGrid to create rows with two columns
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                ForEach(filteredPlaces, id: \.id) { place in
                    NavigationLink(destination: MountainsDetailView(place: place).toolbarRole(.editor), label:  {
                        ZStack {
                            Image(place.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 190, height: 230)
                                .cornerRadius(25)
                            
                            Text(place.title)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(width: 150, alignment: .leading)
                                .position(x: 95, y: 190)
                                                            
                            
                        }
                    })
                    
                }
                
                ForEach(filteredLakes, id: \.id) { lake in
                    NavigationLink(destination: LakesDetailView(place: lake).toolbarRole(.editor), label:  {
                        
                        ZStack {
                            Image(lake.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 190, height: 230)
                                .cornerRadius(25)
                            
                            Text(lake.title)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(width: 100, alignment: .leading)
                                .position(x: 75, y: 195)
                        }
                    })
                }
                
                ForEach(filteredCanyons, id: \.id) { canyon in
                    NavigationLink(destination: CanyonsDetailView(place: canyon).toolbarRole(.editor), label: {
                        ZStack {
                            Image(canyon.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 190, height: 230)
                                .cornerRadius(25)
                            
                            Text(canyon.title)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(width: 100, alignment: .leading)
                                .padding(.trailing, 15)
                                .position(x: 80, y: 200)
                        }
                    })
                }
                
                
            }.padding(5)
            
            
        }
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
