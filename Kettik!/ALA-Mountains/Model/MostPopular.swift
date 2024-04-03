//
//  MostPopular.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 05.07.2023.
//

import SwiftUI


struct Popular: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let city: String
    //let view: UIView
}

struct PopularList {
    static let titles = [
        Popular(imageName: "Kolsay2", title: "Kolsay Lake", city: "Almaty, ALA"),
        Popular(imageName: "Charyn", title: "Charyn Canyon", city: "Almaty, ALA"),
        Popular(imageName: "Shymbulak", title: "Shymbulak", city: "Almaty, ALA"),
        Popular(imageName: "Caspian", title: "Caspian Sea", city: "Aktau, SCO"),
        
    ]
}
