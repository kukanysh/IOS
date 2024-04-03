//
//  DiscoverView.swift
//  News
//
//  Created by Куаныш Спандияр on 02.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverView: View {
    
    @State private var searchText = ""
    @ObservedObject var list = getData(type: "everything")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Discover")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("News from all around the world")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }.position(x: 130, y: 50)
            
            
            HStack {
                Image(systemName: "magnifyingglass") // Add the magnifying glass icon
                    .foregroundColor(.gray) // Customize the color if needed
                    .padding(.leading, 10) // Adjust padding to your preference
                
                TextField("Search", text: $searchText)
                    .frame(width: 340, height: 50) // Adjust width to your preference
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.secondary)
                            .opacity(0.1)
                    )
                    .padding(.trailing, 15) // Adjust padding to your preference
            }
            .frame(width: 380, height: 50) // Adjust width to your preference
            .padding(15)
            .position(x: 220, y: 60) // Adjust position to your preference
            
            
            VStack {
                ForEach(list.datas.indices, id: \.self) { index in
                    let item = list.datas[index]
                    HStack(spacing: 10) {
                        
                        if !item.image.isEmpty {
                            WebImage(url: URL(string: item.image), options: .highPriority, context: nil)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: 130)
                                .cornerRadius(20)
                        }
                        
                        
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text(item.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: 200)
                                .lineLimit(3)
                            
                            Text("Published on: \(item.id)")
                                .opacity(0.5)
                                .frame(width: 200)

                                
                        }
                    }.padding(15)
                    
                }.padding(10)
            }
        }
    }
}

#Preview {
    DiscoverView()
}
