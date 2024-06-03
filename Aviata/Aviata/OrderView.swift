//
//  OrderView.swift
//  Aviata
//
//  Created by Куаныш Спандияр on 28.04.2024.
//

import SwiftUI

struct OrderView: View {
    
    @State private var phoneNumber = ""
    @State private var isFilled = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("background")
                
                VStack(spacing: 30) {
                    
                    Image("logo")
                    
                    Text("Вход в кабинет")
                        .fontWeight(.medium)
                    
                    TextField("+7 (___) ___ ____", text: $phoneNumber)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 370, height: 65)
                                .foregroundColor(.secondary)
                            
                        ).padding(30)
                        .onChange(of: phoneNumber) { newValue in
                            self.isFilled = newValue.count == 11
                        }
                    
                    
                    Button(action: {
                        
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 370, height: 50)
                            .foregroundStyle(isFilled ? Color.color : Color.gray)
                            .overlay(
                                Text("Найти билеты")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        
                    }
                    
                    
                    
                }
            }.ignoresSafeArea()
        }.navigationTitle("Личный кабинет")
            .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    OrderView()
}
