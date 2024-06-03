//
//  ProfileView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 21.06.2023.
//

import SwiftUI
import CoreLocationUI

struct SettingsView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            
            
        Form {
            HStack {
                Text("Version")
                
                Spacer()
                
                Text("1.0");
                    //.font(.headline)
            }
            
            HStack {
                Text("App name")
                
                Spacer()
                
                Text("Kettik!");
                    //.font(.headline)
            }
            
            HStack {
                Text("Location")
                
                Spacer()
        
                Text("Kazakhstan");
                    //.font(.headline)
            }
            
            HStack {
                
                
                Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Language")) {
                    Text("English").tag(1)
                    Text("Kazakh").tag(2)
                }
                
                
                
            }
            
            HStack {
                
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                
                
            }
            
            
            
            
            
            
            
            
        }.navigationTitle("Settings")
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
                    
            }
            .cornerRadius(25)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        
        
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
