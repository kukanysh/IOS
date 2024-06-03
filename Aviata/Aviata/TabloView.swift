//
//  TabloView.swift
//  Aviata
//
//  Created by Куаныш Спандияр on 28.04.2024.
//

import SwiftUI

struct TabloView: View {
    
    var trains: [Tablo] = TabloList.trains
    
    var body: some View {
            ZStack {
                Color("background")
                    .ignoresSafeArea()
                    
                
                VStack(spacing: 70) {
                    
                    Spacer()
                    
                    
                        Form {
                            VStack(alignment: .leading) {
                                
                                HStack {
                                    Text("Алматы")
                                        .font(.headline)
                                    
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                    }) {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.indigo)
                                    }
                                    
                                }
                                
                                Divider()
                                    .padding(.vertical)
                                
                                HStack {
                                    Text("Поезд и направление")
                                        .font(.callout)
                                        .foregroundStyle(.secondary)
                                    Spacer()
                                    
                                    Text("Отпр.")
                                        .font(.callout)
                                        .foregroundStyle(.secondary)
                                    
                                    Text("Приб.")
                                        .font(.callout)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }.frame(height: 180)
                    
                        
                    Form {
                        
                        Text("Время отправления и прибытия указаны по времени г. Астана")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            
                        
                        ForEach(trains, id: \.id) { train in
                                Section {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(train.trainName)
                                            Spacer()
                                            
                                            Text(train.departureTime)
                                                .padding(.trailing, 30)
                                            
                                            Text(train.arrivalTIme)
                                            
                                        }
                                        
                                        HStack {
                                            
                                            Text(train.city1)
                                            
                                            Text("–")
                                            
                                            Text(train.city2)
                                            
                                        }
                                    }
                                }
                        }
                    }
                    
                }
                
            }
    }
}

#Preview {
    TabloView()
}
