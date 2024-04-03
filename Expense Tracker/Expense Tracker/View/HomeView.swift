//
//  HomeView.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 04.11.2023.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var name: String = "Kuanysh"
    
    @State private var totalExpence: String = "170000"
    
    @State private var totalSpends: String = "1700"
    
    var amountOfTime: [String] = ["Day", "Month"]
    
    var spend: [String] = ["2500", "200000"]
    
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Text("Hello, \(name)") // Display the "Hello, [Name]" text
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 50, alignment: .leading)
                        .padding()
                        .position(x: 195, y: 40)
                }
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.purple)
                    .frame(width: 350, height: 200)
                    .position(x: UIScreen.main.bounds.width/2, y: 190)
                
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.white)
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .position(x: 330, y: 120)
                }
                
                HStack {
                    
                    VStack {
                        Text("Outcome")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 350, height: 50, alignment: .leading)
                            .position(x: UIScreen.main.bounds.width/2 + 30, y: 140)
                        
                        
                        Text("\(totalSpends)₸")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                            .frame(width: 250, height: 50, alignment: .leading)
                            .position(x: UIScreen.main.bounds.width/2 - 20, y: 90)
                    }
                }
                
                
                HStack(alignment: .top, spacing: 5) {
                    ForEach(0..<2){ item in
                        ZStack {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .frame(width: 170, height: 100)
                                .position(x: UIScreen.main.bounds.width/2 - 105, y: 370)
                                .foregroundColor(.indigo)
                            
                            Text(amountOfTime[item])
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .position(x: 90, y: 345)
                            
                            Text(spend[item])
                                .font(.title)
                                .fontWeight(.bold)
                                .fontDesign(.monospaced)
                                .foregroundStyle(.white)
                                .position(x: 90, y: 380)
                        }
                        
                    }
                }.padding(.horizontal, 10)
                
                
                
                
                
                
                            
    //              TextField("Enter your name", text: $name)
    //                  .textFieldStyle(RoundedBorderTextFieldStyle()                              .padding()
                    
            }.ignoresSafeArea(.all)
        }
    }
}

#Preview {
    HomeView()
}
