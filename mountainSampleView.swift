//
//  mountainSampleView.swift
//  Kettik!
//
//  Created by Куаныш Спандияр on 02.08.2023.
//

import SwiftUI

struct mountainSampleView: View {
    
    var place: Places
    
    let info: [String] = ["Distance", "Time", "Height"]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .top) {
                        Image(place.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 450 + geometry.frame(in: .global).minY)
                            .clipped()
                            .blur(radius: geometry.frame(in: .global).minY > 100 ? 20 : 0)
                        
                    }
                }
                
                GeometryReader { geometry in
                    ScrollView(showsIndicators: true, content:  {
                        ZStack {
                            RoundedRectangle(cornerRadius: 55, style: .continuous)
                                .foregroundColor(.white)
                                .frame(width: 430)
                                .edgesIgnoringSafeArea(.bottom)
                                .padding(.top)
                            
                            VStack(alignment: .center) {
                                Text(place.title)
                                    .font(.title.bold())
                                    .foregroundColor(.black)
                                    .position(x: 210, y: 70)
                                    .padding(.bottom)
                                
                                HStack {
                                    ForEach(0 ..< 5) {_ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .frame(width: 15, height: 15)
                                    }
                                    Text("(4.9)")
                                        .foregroundColor(.black)
                                }
                                .offset(y: -170)
                                
                                HStack {
                                    Image(systemName: "mappin.and.ellipse")
                                        .foregroundColor(.black)
                                    Text(place.city)
                                        .foregroundColor(.black)
                                }.offset(y: -160)
                                
                                VStack(spacing: 25) {
                                    Text("About")
                                        .font(.title2.bold())
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .position(x: 50, y: -100)
                                    
                                    
                                    Text(place.description)
                                        .foregroundColor(.black)
                                        .lineSpacing(7)
                                        .opacity(0.7)
                                        .frame(width: 360, height: 600)
                                        .position(x: 200, y: -150)
                                }
                                
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
                                                    Text(place.height)
                                                        .multilineTextAlignment(.trailing)
                                                }
                                            }
                                        }
                                    }
                                }
                                .position(x: 200, y: -130)
                                .foregroundColor(.black)
                                .frame(width: 400)
                                
                                
                                
                            }
                            
                        }
                    }).padding(.top, 320)
                        .edgesIgnoringSafeArea(.all)
                }
                
                
                LikeButtonView()
                    .padding(.leading, 300)
                    .padding(.top, -800)
                
                
                
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
    
}
    struct mountainSampleView_Previews: PreviewProvider {
        static var previews: some View {
            mountainSampleView(place: PlacesList.titles.first!)
        }
    }
