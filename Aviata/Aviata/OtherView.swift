//
//  OtherView.swift
//  Aviata
//
//  Created by Куаныш Спандияр on 28.04.2024.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                
                Group {
                    Form {
                        Section {
                                HStack {
                                    Image(systemName: "bell")
                                    Text("Уведомления")
                                }
                                
                            
                            
                            HStack {
                                Image(systemName: "questionmark.circle")
                                Text("Помощь")
                            }
                            
                            HStack {
                                Image(systemName: "a.square")
                                Text("Язык приложения")
                            }
                        }
                        
                        Section {
                                HStack {
                                    Image(systemName: "pencil.line")
                                    Text("Обратная связь")
                                }
                                
                            
                            
                            HStack {
                                Image(systemName: "star")
                                Text("Оцените приложение")
                            }
                            
                        }
                        
                        
                        Section {
                                HStack {
                                    Image(systemName: "airplane")
                                    Text("Авиабилеты")
                                }
                                
                            
                            
                            HStack {
                                Image(systemName: "arrowshape.turn.up.right")
                                Text("Поделиться в WhatsApp")
                            }
                            
                        }
                        
                        
                    }
                }
                
                
                
                
                Text("Версия приложения 3.1.4")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                
                
                
                
            }
            
            
        }
    }
}

#Preview {
    OtherView()
}
