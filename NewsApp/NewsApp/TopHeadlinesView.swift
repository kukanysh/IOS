//
//  TopHeadlinesView.swift
//  NewsApp
//
//  Created by Куаныш Спандияр on 27.02.2024.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit

struct TopHeadlinesView: View {
    
    @ObservedObject var list = getData(type: "top-headlines")
    
    var type: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(list.datas.indices, id: \.self) { index in
                    let item = list.datas[index]
                    
                    NavigationLink(destination: webView(url: item.url)
                                    .navigationBarTitle("", displayMode: .inline)) {
                        VStack {
                            if !item.image.isEmpty {
                                WebImage(url: URL(string: item.image), options: .highPriority, context: nil)
                                    .resizable()
                                    .frame(width: 320, height: 165)
                                    .cornerRadius(5)
                            }
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(item.title)
                                        .fontWeight(.heavy)
                                        .frame(width: 230)
                                }
                                
                                Divider()
                                    .padding(25)
                                
                                BookmarkButton(isSaved: item.isSaved) {
                                    self.toggleBookmark(at: index)
                                }
                            }
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
            .navigationBarTitle("Top Headlines")
            .frame(width: 430)
        }
    }
    
    private func toggleBookmark(at index: Int) {
        list.datas[index].isSaved.toggle()
    }
}

struct BookmarkButton: View {
    var isSaved: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 28)
                .foregroundColor(isSaved ? .black : .gray)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TopHeadlinesView(type: "top-headlines")
}
