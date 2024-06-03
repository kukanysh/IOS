//
//  Model.swift
//  Aviata
//
//  Created by Куаныш Спандияр on 01.05.2024.
//

import Foundation

struct Tablo: Identifiable {
    let id = UUID()
    let trainName: String
    let city1: String
    let city2: String
    let departureTime: String
    let arrivalTIme: String
}

struct TabloList {
    static let trains = [
        Tablo(trainName: "337T", city1: "Алматы 2", city2: "Достык", departureTime: "13:00", arrivalTIme: "–"),
        Tablo(trainName: "011X", city1: "Алматы 2", city2: "Шымкент", departureTime: "13:20", arrivalTIme: "–"),
        Tablo(trainName: "034T", city1: "Актобе-1", city2: "Алматы 1", departureTime: "–", arrivalTIme: "13:36"),
        Tablo(trainName: "807X", city1: "Алматы 2", city2: "Капчагай", departureTime: "13:45", arrivalTIme: "–"),
        Tablo(trainName: "023X", city1: "Алматы 1", city2: "Актобе-1", departureTime: "15:35", arrivalTIme: "–"),
        Tablo(trainName: "031T", city1: "Павлодар", city2: "Алматы 2", departureTime: "–", arrivalTIme: "15:35"),
        Tablo(trainName: "831X", city1: "Сары Озек", city2: "Алматы 1", departureTime: "–", arrivalTIme: "16:38"),
        Tablo(trainName: "001Ь ", city1: "Ташкент Ц", city2: "Алматы 2", departureTime: "–", arrivalTIme: "17:02"),
        Tablo(trainName: "025T", city1: "Алматы 2", city2: "Шымкент", departureTime: "17:04", arrivalTIme: "–"),
        Tablo(trainName: "351T", city1: "Оскемен 1", city2: "Алматы 2", departureTime: "–", arrivalTIme: "17:50"),
        
    ]
}
