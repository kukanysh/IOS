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
            Image(page.imageUrl)
                .resizable()
                .frame(height: 450)
                .scaledToFit()
                .edgesIgnoringSafeArea(.top)
                .position(x: 215, y: 250)
            
            RoundedRectangle(cornerRadius: 55)
                .frame(width: UIScreen.main.bounds.width, height: 700)
                .foregroundColor(.white)
                .position(x: 215, y: 750)
            
            Text(page.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(width: 250)
                .position(x: 120, y: 500)
            
            Text(page.description)
                .font(.title)
                .fontWeight(.regular)
                .fontDesign(.rounded)
                .foregroundColor(.black)
                .lineSpacing(8)
                .multilineTextAlignment(.leading)
                .frame(width: 350)
                .position(x: 193, y: 600)
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
