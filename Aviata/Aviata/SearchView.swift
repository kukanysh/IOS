//
//  SearchView.swift
//  Aviata
//
//  Created by Куаныш Спандияр on 28.04.2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var showingBottomSheet = false
    @State var showingDateSheet = false
    @State var showDate: Date
    
    
    
    var body: some View {
        ZStack {
            
            Color("background")
            
            VStack {
                
                VStack {
                    Spacer()
                    
                    Image("logo")
                    
                    Spacer()
                    
                    Image("train")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 340, height: 160)
                }
                
                
                Spacer()
                
                

                
                VStack(alignment: .leading, spacing: 10){
                    
                    Spacer()
                    
                    Button("Откуда"){
                        showingBottomSheet.toggle()
                    }.font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundStyle(.fill)
                    
                    HStack {
                        VStack {
                            Divider()
                                .padding(.trailing)
                        }
                        
                        Button(action: {

                        }) {
                            Image(systemName: "arrow.up.and.down")
                                .font(.largeTitle)
                                .foregroundColor(Color("color"))
                        }

                        
                        
                    }
                    
                    Button("Куда"){
                        showingBottomSheet.toggle()
                    }.font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundStyle(.fill)
                    
                    Divider()
                    
                    HStack(){
                        
                        VStack(alignment: .leading) {
                            
                            Text("Туда")
                                .foregroundStyle(.gray)
                            
                            Button("Туда"){
                                showingDateSheet.toggle()
                            }.font(.largeTitle)
                                .fontWeight(.medium)
                                .foregroundStyle(.foreground)
                        }
                        
                        Divider()
                            .frame(height:60)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Выбрать дату")
                                .foregroundStyle(.gray)
                            
                            Button("Обратно"){
                                showingDateSheet.toggle()
                            }.font(.largeTitle)
                                .fontWeight(.medium)
                            .foregroundStyle(.fill)
                        }
                        
                           
                    }
                    
                    
                        

                }.padding(20)
                    .sheet(isPresented: $showingBottomSheet){
                        BottomSheetView()
                            .presentationDragIndicator(.visible)
                            .presentationCornerRadius(15)
                    }
                    .sheet(isPresented: $showingDateSheet){
                        DateSheetView()
                            .presentationDragIndicator(.visible)
                            .presentationCornerRadius(15)
                    }
                
                
                
                
                VStack {
                    
                    Button(action: {
                        
                    }) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 370, height: 50)
                            .foregroundStyle(Color("color"))
                            .overlay(
                                Text("Найти билеты")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            )
                        
                    }
                    
                }
                .padding(.bottom, 110)
            }
        }.ignoresSafeArea()
    }
}


struct BottomSheetView: View {
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    @State var showingBottomSheet = false
    var body: some View {
        ZStack {
            
            Color("sheetColor")
            
            VStack {
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        Spacer()
                        
                        
                        Text("Откуда")
                            .font(.headline)
                        
                        Spacer()
                        
                        Button {
                            showingBottomSheet.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.gray)
                                .font(.title2)
                                .padding(30)
                            
                        }
                        
                    }.searchable(text: $searchText) {
                        TextField("Поиск станции", text: $searchText, onEditingChanged: { isEditing in
                            self.isSearching = isEditing
                        })
                    }
                    
                    
                    
                    
                    
                    
                }.padding(.top, 10)
                
    
            }
              
        }.ignoresSafeArea()
        
    }
}


struct DateSheetView: View {
    
    @State var showingDateSheet = false
    
    var days:[String] = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
    
    var body: some View {
        ZStack {
            
            Color("sheetColor")
            
            VStack {
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        Spacer()
                        
                        
                        Text("Дата поездки туда")
                            .font(.headline)
                        
                        Spacer()
                        
                        Button {
                            showingDateSheet.toggle()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.gray)
                                .font(.title2)
                                .padding(15)
                            
                        }
                        
                    }
                    
                    HStack {
                        ForEach(days, id: \.self) { day in
                            Text(day)
                                .padding(12)
                        }
                    }
                    
                    
                }.padding(.top, 10)
                
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 360, height: 300)
                            .foregroundStyle(.separator)
                        .opacity(0.6)
                        
                        VStack {
                            Text("May")
                                .font(.headline)
                            
                            
                        }
                    }
                    
                }
    
            }
              
        }.ignoresSafeArea()
        
        
    }
}







#Preview {
    SearchView(showDate: .now)
}
