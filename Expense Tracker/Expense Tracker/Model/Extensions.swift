//
//  Extensions.swift
//  Expense Tracker
//
//  Created by Куаныш Спандияр on 05.11.2023.
//

import Foundation
import SwiftUI


extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/уууу"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {
            return Date()
        }
        
        return parsedDate
    }
}
