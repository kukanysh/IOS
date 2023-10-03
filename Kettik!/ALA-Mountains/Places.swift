//
//  Places.swift
//  ALA-Mountains
//
//  Created by Куаныш Спандияр on 25.06.2023.
//

import SwiftUI

struct Places: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let city: String
    let height: String
    let distance: String
    let time: String
}

struct Canyons: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let city: String
    let distance: String
    let time: String
}

struct Lakes: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let city: String
    let depth: String
    let distance: String
    let time: String
}

struct PlacesList {
    static let titles = [
        Places(imageName: "Shymbulak2",
               title: "Shymbulak",
               description: "The path to the Shymbulak peak starts from the Talgar pass. The ascent is carried out along a barely noticeable sandy path, interspersed with loose rocks.",
               city: "Almaty, ALA",
               height: "3450m",
               distance: "20 km",
               time: "1 - 2 hours"),
        
        Places(imageName: "Kumbel",
               title: "Kumbel",
               description: "Kumbel Peak is the most popular peak in the mountains of the Ile-Alatau reserve. A mountain trail leads to the peak, the route is considered not difficult, and is suitable for all age categories.",
               city: "Almaty, ALA",
               height: "3200m",
               distance: " ",
               time: " "),
        
        Places(imageName: "Bukreev",
               title: "Bukreev",
               description: "Bukreev Peak is a hidden gem in Almaty at an altitude of 3010 m above the Koterbulak mountain range. It is also a distinctive tourist destination for adventure and thrill lovers.",
               city: "Almaty, ALA",
               height: "3010m",
               distance: " ",
               time: " "),
        
        Places(imageName: "TriBrata",
               title: "Three Brothers",
               description: "The Three Brothers Summit is an ideal tourist destination for lovers of climbing and adventure in Almaty, where you can enjoy with adventurous friends many beautifully landscaped trails.",
               city: "Almaty, ALA",
               height: "2860m",
               distance: " ",
               time: " "),
        
        Places(imageName: "Almatinskiy_pik",
               title: "Big Almaty Peak",
               description: "The Big Almaty Peak (3680 m) is also called Big Almaty. It belongs to the northern slopes of the Trans-Ili Alatau and has the shape of a pyramid.",
               city: "Almaty, ALA",
               height: "3680m",
               distance: " ",
               time: " ")
    ]
}

struct CanyonsList {
    static let titles = [
        Canyons(imageName: "Charyn",
                title: "Charyn",
                description: "Charyn Canyon is often compared to the Grand Canyon in the United States. Although it's much smaller, it's equally impressive. The canyon is located 200 kilometers (124 mi) away from the city of Almaty.",
                city: "Almaty, ALA",
               distance: "",
                time: ""),
        Canyons(imageName: "Bozzhyra2",
                title: "Bozjyra",
                description: "Bozjyra is a magnificent creation of weathering and erosion, located on the territory of the Ustyurt Plateau. Here you can see vast clay deserts, limestone mountains, buttes more than 200 meters (650 ft) high.",
                city: "Aktau, SCO",
                distance: "",
                time: ""),
        Canyons(imageName: "Aksu",
                title: "Aksu",
                description: "You need to make certain efforts in order to visit a bottom of the Aksu Canyon. First, you have to prove to the strict management of the Aksu-Jabagly Nature Reserve that you really need to visit this strictly protected territory. And secondly, to go down a half kilometer slope.",
                city: "Shymkent, CIT",
                distance: "",
                time: " "),
        Canyons(imageName: "Akmeshit",
                title: "Akmeshit",
                description: "“Akmeshit”, translated from the Kazakh language, means “White Mosque”. According to a legend, women and children found shelter here during Dzungarian invasion.",
                city: "Shymkent, CIT",
               distance: "",
                time: ""),
    
    ]
}

struct LakesList {
    static let titles = [
        Lakes(imageName: "Kolsay2",
              title: "Kolsay",
              description: "Kolsay Lakes are located on the territory of the Kolsai Lakes State National Park, 300 kilometers from Almaty to the south-east, 10 kilometers north of the border with Kyrgyzstan.",
              city: "Almaty, ALA",
              depth: "50m",
             distance: "",
             time: ""),
        Lakes(imageName: "Kaiyndy",
              title: "Kaiyndy",
              description: "Lake Kaindy got its name due to the birch grove growing in the gorge, near the checkpoint of the national park. The same name also has a mountain gorge, a river flowing along the bottom of the gorge.",
              city: "Almaty, ALA",
              depth: "30m",
             distance: "",
             time: ""),
        Lakes(imageName: "Balkash",
              title: "Balkash Lake",
              description: "Balkhash Lake is the third largest lake in Kazakhstan, after the Caspian and Aral Seas. The lake is 614 km in length and from 3.5 to 44 km in width. Western part of the lake, which receives water form Ili River, is fresh and its Eastern part is salty.",
              city: "Almaty, ALA",
              depth: "26m",
             distance: "",
             time: ""),
        Lakes(imageName: "Caspian",
              title: "Caspian Sea",
              description: "The Caspian Sea is the largest closed reservoir in the world, which washes the western part of Kazakhstan. The name of the Sea is connected with the Caspii tribes who had settled these shores from time immemorial.",
              city: "Aktau, SCO",
              depth: "1025m",
             distance: "",
              time: ""),
        Lakes(imageName: "Aral",
              title: "Aral Sea",
              description: "We don't appreciate what we have until it's gone. This phrase fits the situation of the Aral Sea perfectly. In recent decades, much of the water which used to flow into the Aral Sea was diverted for growing crops. As a result, the sea has shrunk dramatically.",
              city: "Kyzylorda, KZO",
              depth: "42m",
             distance: "",
             time: ""),
        Lakes(imageName: "Alakol",
              title: "Alakol",
              description: "This lake is the second-largest inland bodies of Kazakhstan and the only deep-lake among the lakes in the republic. More than 15 tributaries flow into the lake, the main of them: Urzhar, Katynsu, Emelkuysa, Yrgayty, Zhamanty, Zhamanotkol, Tasty.",
              city: "Almaty, ALA",
              depth: "22m",
             distance: "",
             time: "")
    ]
}
