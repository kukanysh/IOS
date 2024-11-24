//
//  Model.swift
//  BudgetTrackerApp
//
//  Created by Куаныш Спандияр on 31.10.2024.
//

import Foundation

enum TransactionType: Codable {
    case income
    case expense
}

struct TransactionModel: Codable {
    let id: UUID
    let description: String
    let amount : Double
    var type: TransactionType
}
