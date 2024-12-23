//
//  LakesDetailView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 29.06.2023.
//

import SwiftUI
import AVKit

struct LakesDetailView: View {
    
    var place: Lakes
    
    let info: [String] = ["Distance", "Time", "Depth"]
    
    @Environment(\.presentationMode) var presentationMode
    
    let url = URL(string: "https://www.youtube.com/shorts/kkN85toZgXY")!
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                GeometryReader { reader -> AnyView in
                    
                    let offset = reader.frame(in: .global).minY
                    return AnyView(
                        Image(place.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 450 + (offset > 0 ? offset : 0))
                            .offset(y: (offset > 0 ? -offset : 0))
                            .edgesIgnoringSafeArea(.top)
                    )
                    
                    
                }.frame(height: 250)
            
                
                RoundedRectangle(cornerRadius: 45)
                    .frame(width: UIScreen.main.bounds.width, height: 600)
                    .foregroundColor(Color("Color"))
                    .padding(.top, 125)
                
                //title and city
                    
                    Text(place.title)
                        .font(.title.bold())
                        .multilineTextAlignment(.trailing)
                        .padding(.top, -570)
                        .padding(.trailing, 235)
                        .frame(width: 350, height: 30, alignment: .leading)
                        .position(x: 205)
                
                
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(.top, -580)
                        .padding(.leading, 250)
                    
                    Text("4.9")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, -579)
                }.background {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 95, height: 65)
                        .padding(.top, -600)
                        .padding(.leading, 250)
                        .foregroundColor(.teal)
                }
                
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .padding(.top, -550)
                        .position(x: 40)
                        .foregroundColor(.red)
                    
                    Text(place.city)
                        .padding(.top, -550)
                        .position(x: -100)
                        .foregroundColor(.secondary)
                
                }
                
                //description
                
                Text("About")
                    .font(.title2.bold())
                    .padding(.top, -480)
                    .padding(.trailing, 295)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .position(x: 215, y: 0)
                
                Text(place.description)
                    .opacity(0.6)
                    .lineSpacing(8)
                    .padding(.top, -430)
                    .frame(width: 360, alignment: .leading)
                    .padding(.leading, 5)
                
                
                //video
                

                    NavigationView {
                        VideoPlayer(player: AVPlayer(url: url))
                    }.frame(width: 350, height: 200)
                    .cornerRadius(25)
                    .position(x: 195, y: -180)
                    .padding(.top, 15)
                
                
                //additional info
                
                GroupBox() {
                    DisclosureGroup("Additional Info") {
                        ForEach(0..<info.count, id: \.self) { item in
                            Divider()
                                .padding(6)
                            
                            HStack {
                                Group{
                                    Image(systemName: "info.circle")
                                    Text(info[item])
                                }
                                .foregroundColor(.black)
                                .font(.headline)
                                
                                Spacer(minLength: 25)
                                
                                if (info[item] == "Distance"){
                                    Text(place.distance)
                                        .multilineTextAlignment(.trailing)
                                } else if (info[item] == "Time") {
                                    
                                    Text(place.time)
                                        .multilineTextAlignment(.trailing)
                                } else {
                                    Text(place.depth)
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                        }
                    }
                }
                    .frame(width: 360)
                    .padding(.top, -250)
                
                
                LikeButtonView()
                    .padding(.leading, 320)
                    .padding(.top, -1130)
                
                    
            }
            
            
        }
        .edgesIgnoringSafeArea(.all)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 10)
                .background(Color.white)
                .clipShape(Circle())
        }
        )
        .gesture(DragGesture().onEnded { value in
            if value.translation.width > 100 {
                presentationMode.wrappedValue.dismiss()
            }
        })
        .contentShape(Rectangle())

        
        
        
    }
}


struct LakesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LakesDetailView(place: LakesList.titles.first!)
    }
}
