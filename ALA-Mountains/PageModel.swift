//
//  PageModel.swift
//  Kettik!
//
//  Created by Куаныш Спандияр on 28.08.2023.
//

import Foundation


struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Explore New Places", description: "Discover the most precious places in Kazakhstan", imageUrl: "Shymbulak", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Explore New Places", description: "Discover the most precious places in Kazakhstan", imageUrl: "Kolsay2", tag: 1),
        Page(name: "Welcome to Kettik!", description: "Discover the most precious places in Kazakhstan", imageUrl: "Aksu", tag: 2),
        Page(name: "You are all set", description: "Let's find your paradise", imageUrl: "Almatinskiy_pik", tag: 3),
    ]
}
