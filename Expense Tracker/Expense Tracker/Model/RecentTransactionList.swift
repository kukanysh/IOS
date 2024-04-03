//
//  RecentTransactionList.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 05.11.2023.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("Show All")
                        Image(systemName: "chevron.right")
                    }.foregroundColor(.gray)
                }
            }
            .padding(.top)
            
            ForEach(transactionListVM.transactions) { transaction in
                TransactionRow(transaction: transaction)
            }
            
        }
        .padding()
    }
}

#Preview {
   let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionlistPreviewData
        return transactionListVM
   }()
    
    RecentTransactionList()
        .environmentObject(transactionListVM)
}
