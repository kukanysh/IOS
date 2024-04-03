//
//  HomeView.swift
//  News
//
//  Created by Куаныш Спандияр on 02.03.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    @ObservedObject var list1 = getData(type: "top-headlines")
    @ObservedObject var list2 = getData(type: "everything")
    
    
    
    var body: some View {
        ScrollView {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Image(systemName: "line.3.horizontal")
                            .position(x: 85,y: 35)
                            .frame(width: 20)
                            .foregroundStyle(.black)
                            .padding(.trailing, 150)
                            .background(
                                Circle()
                                    .fill(.regularMaterial)
                                    .frame(width: 50)
                                    .position(x: 100, y: 50)
                                    .padding(-15)
                                    .padding(.trailing, 150)
                            )
                        
                    })
                    
                    Spacer()
                        .padding(25)
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Image(systemName: "magnifyingglass")
                            .position(x:35,y: 35)
                            .frame(width: 20)
                            .foregroundStyle(.black)
                            .padding(.trailing, 60)
                            .background(
                                Circle()
                                    .fill(.regularMaterial)
                                    .frame(width: 50)
                                    .position(x: 50, y: 50)
                                    .padding(-15)
                            )
                        
                    })
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Image(systemName: "bell")
                            .position(x:35,y: 35)
                            .frame(width: 20)
                            .foregroundStyle(.black)
                            .padding(.trailing, 100)
                            .background(
                                Circle()
                                    .fill(.regularMaterial)
                                    .frame(width: 50)
                                    .position(x: 50, y: 50)
                                    .padding(-15)
                            )
                        
                    })
                    
                    
                }
                
                HStack {
                    Text("Breaking News")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("View All")
                    })
                    
                }.padding(50)
                
                
                ZStack {
                    ForEach(list1.datas.indices, id: \.self) { index in
                        let item = list1.datas[index]
                        if !item.image.isEmpty {
                            WebImage(url: URL(string: item.image), options: .highPriority, context: nil)
                                .resizable()
                                .frame(width: 300, height: 200)
                                .cornerRadius (25)
                                .opacity(currentIndex == index ? 1.0 : 0.5)
                                .scaleEffect (currentIndex == index ? 1.2 :
                                                0.8)
                                .offset(x: CGFloat(index - currentIndex) *
                                        300 + dragOffset, y: 0)
                            
                            
                            //                            .background(
                            //                                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.1)]),
                            //                                               startPoint: .top, endPoint: .bottom)
                            //                                    .frame(height: 90)
                            //                                    .frame(width: 359)
                            //                                    .position(x: 150, y: 175)
                            //
                            //                            )
                            
                        }
                        
                        
                        
                        
                        
                        Text(item.title)
                            .foregroundStyle(.white)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .position(x: 145, y: 150)
                            .frame(width: 280)
                            .lineLimit(3)
                            .opacity(currentIndex == index ? 1.0 : 0.5)
                            .scaleEffect (currentIndex == index ? 1.2 :
                                            0.8)
                            .offset(x: CGFloat(index - currentIndex) *
                                    300 + dragOffset, y: 0)
                        
                    }
                }.gesture(
                    DragGesture()
                        .onEnded({value in
                            let threshold: CGFloat = 50
                            if value.translation.width > threshold {
                                withAnimation {
                                    currentIndex = max(0, currentIndex - 1)
                                }
                            } else if value.translation.width < -threshold {
                                withAnimation(){
                                    currentIndex = min($list1.datas.count - 1, currentIndex + 1)
                                }
                            }
                        })
                )
                
                
                HStack {
                    Text("Recommendation")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    
                }.padding(50)
                
                
                VStack {
                    ForEach(list2.datas.indices, id: \.self) { index in
                        let item = list2.datas[index]
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
    HomeView()
}
