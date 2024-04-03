////
////  DetailedView.swift
////  News
////
////  Created by Куаныш Спандияр on 03.03.2024.
////
//
//import SwiftUI
//import SDWebImageSwiftUI
//
//struct DetailedView: View {
//    
//    @ObservedObject var list = getData(type: "everything")
//    
//    var body: some View {
//        ScrollView {
//                    
//            if !list.datas.isEmpty {
//                        WebImage(url: URL(string: item.image), options: .highPriority, context: nil)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 400, height: 330)
//                            .cornerRadius(20)
//                    }
//                
//                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                    .frame(width: 400, height: 200)
//                    .foregroundStyle(.white)
//                    
//                    
//                    
//                    VStack(alignment: .leading, spacing: 15) {
//                        
//                        Text(item.title)
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .frame(width: 200)
//                            .lineLimit(3)
//                        
//                        Text("Published on: \(item.id)")
//                            .opacity(0.5)
//                            .frame(width: 200)
//
//                            
//                    }
//
//                
//        }
//    }
//}
//
//#Preview {
//    DetailedView()
//}
