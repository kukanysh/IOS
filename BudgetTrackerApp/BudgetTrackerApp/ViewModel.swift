//
//  ViewModel.swift
//  BudgetTrackerApp
//
//  Created by Куаныш Спандияр on 31.10.2024.
//

import Foundation

class BudgetViewModel {
    var transactions: [TransactionModel] = []
    
    
    private(set) var totalIncome: Double = 0.0
    private(set) var totalExpenses: Double = 0.0
    private(set) var balance: Double = 0.0
    
    var onBudgetUpdated: ((Double, Double, Double) -> Void)?
    
    init() {
        // Load saved transactions when initializing the view model
        if let savedTransactions = loadTransactions() {
            transactions = savedTransactions
            calculateBudget() // Update the budget after loading transactions
        }
    }
    
    
    func addTransaction(title: String, amount: Double, type: TransactionType) {
        let newTransaction = TransactionModel(
            id: UUID(),
            description: title,
            amount: amount,
            type: type)
        transactions.append(newTransaction)
        calculateBudget()
        saveTransactions(transactions: transactions)
    }
    
    func deleteTransaction(id: UUID) {
        transactions.removeAll { $0.id == id }
        calculateBudget()
        saveTransactions(transactions: transactions)
    }
    
    
    func calculateBudget() {
        totalIncome = transactions.filter { $0.type == .income }.reduce(0) { $0 + $1.amount }
        totalExpenses = transactions.filter { $0.type == .expense }.reduce(0) { $0 + $1.amount }
        balance = totalIncome - totalExpenses
        onBudgetUpdated?(totalIncome, totalExpenses, balance)
    }
    
    func formattedAmount(for transaction: TransactionModel) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0 // Remove unnecessary zeros
        let formattedNumber = formatter.string(from: NSNumber(value: transaction.amount)) ?? "0"
        return transaction.type == .income ? "+\(formattedNumber)₸" : "-\(formattedNumber)₸"
    }
    
    
    func saveTransactions(transactions: [TransactionModel]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(transactions)
            UserDefaults.standard.set(data, forKey: "transactions")
        } catch {
            print("Failed to encode transactions: \(error)")
        }
    }
    
    
    func loadTransactions() -> [TransactionModel]? {
        guard let data = UserDefaults.standard.data(forKey: "transactions") else { return nil }
        let decoder = JSONDecoder()
        do {
            let transactions = try decoder.decode([TransactionModel].self, from: data)
            return transactions
        } catch {
            print("Failed to decode transactions: \(error)")
            return nil
        }
    }
    
    


    
    
}


