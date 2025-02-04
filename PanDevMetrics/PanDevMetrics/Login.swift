//
//  Login.swift
//  PanDevMetrics
//
//  Created by Куаныш Спандияр on 27.01.2025.
//

import SwiftUI

struct Login: View {
    
    @State var serverUrl: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    let timeZoneView = TimeZonePickerView()
    
    var body: some View {
        VStack {
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                
                Text("PanDev Metrics")
                    .font(.largeTitle)
   
                
                
                Group{
                    
                    Text("Server URL")
                        .padding(.leading, -200)
                        .padding(.bottom, -10)
                    
                    TextField("Server URL", text: $serverUrl)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 400)
                        .padding(10)
                        
                        
                    Text("Email")
                        .padding(.leading, -200)
                        .padding(.bottom, -10)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 400)
                        .padding(10)
                    
                    Text("Password")
                        .padding(.leading, -200)
                        .padding(.bottom, -10)
                    
                    TextField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 400)
                        .padding(10)
                    
                    timeZoneView
                        .padding(.leading, -10)
                        .padding(.bottom, -60)
                    
                    
                    Text("About our company here")
                        .padding(30)
                    
  
                }
                
                
                HStack(spacing: 10) {
                    Button(action: {
                        print("Saved")
                    }) {
                        Text("Save")
                            .frame(width: 60, height: 30)
                    }
                    .foregroundColor(.blue)
                    .cornerRadius(8)


                    Button(action: {
                        print("Canceled")
                    }) {
                        Text("Cancel")
                            .frame(width: 60, height: 30)
                    }
                    .foregroundColor(.white)
                    .cornerRadius(8)

                }.padding(.leading, 365)
                    .offset(x: 10, y: 60)
                
                
                
            }.padding(.top, -100)
            
        }.padding()
        .frame(width: 600, height: 500)
        .navigationTitle("Login")
        
    }
}

#Preview {
    Login()
}
