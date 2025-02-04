//
//  ContentView.swift
//  PanDevMetrics
//
//  Created by Куаныш Спандияр on 27.01.2025.
//

import SwiftUI

struct ContentView: View {
    
   
    
    
    var body: some View {
        VStack {
            
            Login()
                .aspectRatio(contentMode: .fit)
            
            
        }
        .padding()
        .frame(width: 500, height: 400)
        
        
    }
}

#Preview {
    ContentView()
}
