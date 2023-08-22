//
//  LikeButtonView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 24.07.2023.
//

import SwiftUI

struct LikeButtonView: View {
    
    @State private var isLiked = false
    
    var body: some View {
        Button(action: {
            self.isLiked.toggle()
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 19)
                .foregroundColor(isLiked ? .red: .gray)
                //.padding(.leading, 300)
                .background {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        //.padding(.leading, 300)
                }
        })
    }
}

struct LikeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LikeButtonView()
    }
}
