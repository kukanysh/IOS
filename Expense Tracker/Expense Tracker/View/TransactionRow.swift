//
//  TransactionRow.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 05.11.2023.
//

import SwiftUI

struct TransactionRow: View {
    
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.gray.opacity(0.6))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "apple.logo")
                        .foregroundStyle(.black)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(7)
                    .lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font (.footnote)
                    .foregroundColor (.secondary)
            }
            
            Spacer()
            
            Text(transaction.signedAmount, format: .currency(code: "KZT"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.add.rawValue ? Color.green: .red)

        }.padding([.top, .bottom], 8)
    }
}

#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
