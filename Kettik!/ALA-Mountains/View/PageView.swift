//
//  PageView.swift
//  Kettik!
//
//  Created by Куаныш Спандияр on 28.08.2023.
//

import SwiftUI

struct PageView: View {
    
    var page: Page
    
    var body: some View {
        ZStack {
            
            Color(.white)
                .ignoresSafeArea(.all)
                
            
            Text(page.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .fontDesign(.monospaced)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(width: 300, alignment: .leading)
                .position(x: 165, y: 150)
                .padding(.trailing)
            
            
            Text(page.description)
                .font(.title3)
                .fontWeight(.light)
                .fontDesign(.rounded)
                .fontDesign(.monospaced)
                .foregroundColor(.black)
                .lineSpacing(7)
                .opacity(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: 400, alignment: .leading)
                .position(x: 215, y: 260)
            
            Image(page.imageUrl)
                .resizable()
                .frame(height: 450)
                .scaledToFit()
                .edgesIgnoringSafeArea(.top)
                .position(x: 215, y: 580)
    
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
