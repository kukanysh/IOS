//
//  ToDoitem.swift
//  ToDoList
//
//  Created by Куаныш Спандияр on 11.10.2024.
//

import Foundation

struct ToDoitem: Codable {
    var id: UUID
    var title: String
    var description: String
    var isDone: Bool
}
