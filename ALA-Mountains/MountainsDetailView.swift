//
//  MountainsDetailView.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 25.06.2023.
//

import SwiftUI

struct MountainsDetailView: View {
    
    var place: Places
    
    let info: [String] = ["Distance", "Time", "Height"]
    
    @Environment(\.presentationMode) var presentationMode
    
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
                    .padding(.trailing, 195)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .position(x: 255)
                
                
                
                //review
                
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
                        .position(x: 50)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.red)
                    
                    Text(place.city)
                        .padding(.top, -550)
                        .position(x: -100)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.secondary)
                
                }
                
                //description
                
                Text("About")
                    .font(.title2.bold())
                    .padding(.top, -480)
                    .padding(.trailing, 265)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .position(x: 243, y: 0)
                
                Text(place.description)
                    .opacity(0.6)
                    .lineSpacing(8)
                    .padding(.top, -430)
                    .frame(width: 380, alignment: .leading)
                    .padding(.leading, 5)
                    .multilineTextAlignment(.leading)
                
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
                                    Text(place.height)
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                        }
                    }
                }
                    .frame(width: 380)
                    .padding(.top, -300)
                
                
                LikeButtonView()
                    .padding(.leading, 320)
                    .padding(.top, -930)
                
                    
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




struct MountainsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MountainsDetailView(place: PlacesList.titles.first!)
    }
}
