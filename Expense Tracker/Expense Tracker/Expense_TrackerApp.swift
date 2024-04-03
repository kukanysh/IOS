//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 04.11.2023.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
        
    }
}
