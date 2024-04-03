//
//  GroupedExpense.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 05.11.2023.
//

import SwiftUI

struct GroupedExpense: Identifiable {
    var id: UUID = .init()
    var date: Date
    var expenses: [Expense]
}
