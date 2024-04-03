//
//  TransactionModel.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 05.11.2023.
//

import Foundation

struct Transaction: Identifiable, Decodable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Int
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool 
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Int {
        return type == TransactionType.add.rawValue ? amount: -amount
    }
    
}

enum TransactionType: String {
    case add = "get"
    case spend = "spend"
}

