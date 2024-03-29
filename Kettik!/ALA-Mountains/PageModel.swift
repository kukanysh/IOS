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
    
    static var samplePage = Page(name: "Explore New Places", description: "Discover the most precious places in Kazakhstan", imageUrl: "first", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to Kettik!", description: "Discover the most precious places in Kazakhstan. Choose your destination and plan your trip.", imageUrl: "first", tag: 1),
        Page(name: "Explore New Places", description: "Find fabulous places for your inner peace", imageUrl: "second", tag: 2),
        Page(name: "You are ready to go!", description: "Let's find your paradise in Kazakhstan", imageUrl: "third", tag: 3),
    ]
}
