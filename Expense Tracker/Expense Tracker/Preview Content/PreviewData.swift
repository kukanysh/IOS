//
//  PreviewData.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 05.11.2023.
//

import Foundation
import SwiftUI
var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 1100, type: "add", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)
var transactionlistPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
