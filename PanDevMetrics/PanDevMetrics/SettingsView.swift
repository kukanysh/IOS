//
//  SettingsView.swift
//  PanDevMetrics
//
//  Created by Куаныш Спандияр on 29.01.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @State var serverUrl: String
    @State var email: String
    @State var password: String
    let timeZoneView = TimeZonePickerView()
    
    var body: some View {
        VStack {
            

                Text("PanDev Metrics")
                    .font(.largeTitle)
                
                
                Text("Server URL")
                    .font(.title3)
                    .padding(.leading, -160)
                
                
                Text("Select Server:")
                    .font(.title3)
                
                TextField("Select Server", text: $serverUrl)
                    .textFieldStyle(.roundedBorder)
                    .padding(40)
                    .padding(.top, -40)
                
                
                Text("Email")
                    .font(.title3)
                    .padding(.leading, -160)
                    .padding(.top, -20)
                    
                
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding(40)
                    .padding(.top, -40)
            
            Text("Password")
                .font(.title3)
                .padding(.leading, -160)
                .padding(.top, -20)
            
                
            
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(40)
                .padding(.top, -40)
            
            
            timeZoneView
                .padding(.leading, -10)
                .padding(.bottom, -60)
            
            
            
                
            
            
            
            
        }.frame(width: 400, height: 500)
    }
}

#Preview {
    SettingsView(serverUrl: "Select Server URL", email: "260505kuka@gmail.com", password: "2605")
}
