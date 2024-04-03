//
//  Bookmarks.swift
//  NewsApp
//
//  Created by Куаныш Спандияр on 28.02.2024.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit

struct Bookmarks: View {
    
    @ObservedObject var list = getData(type: "everything")
    
    var body: some View {
        List {
            ForEach(list.datas.indices, id: \.self) { index in
                let item = list.datas[index]
                
                NavigationLink(destination: webView(url: item.url)
                                .navigationBarTitle("", displayMode: .inline)) {
                    VStack {
                        if !item.image.isEmpty && item.isSaved == true {
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
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
        .frame(width: 420)
        .navigationBarTitle("Bookmarked Articles")
    }
}

#Preview {
    Bookmarks()
}
