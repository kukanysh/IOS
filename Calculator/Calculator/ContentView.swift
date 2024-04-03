//
//  ContentView.swift
//  Calculator
//
//  Created by Куаныш Спандияр on 13.03.2024.
//

import SwiftUI
import Foundation

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
    case mutliply = "×"
    case equal = "="
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "+/-"
    case clearMemory = "mc"
    case addMemory = "m+"
    case removeMemory = "m-"
    case recallMemory = "mr"
    
}

enum Operation {
    case add, subtract, multiply, divide, none
}


struct ContentView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var memoryValue: Double = 0.0
    
    @State var currentOperation: Operation = .none
    
    let rows: [[CalcButton]] = [
            [.clearMemory, .addMemory, .removeMemory, .recallMemory],
            [.clear, .negative, .percent, .divide],
            [.seven, .eight, .nine, .mutliply],
            [.four, .five, .six, .subtract],
            [.one, .two, .three, .add],
            [.zero, .decimal, .equal],
        ]
    

    
    let lightGray = Color(red: 212.0/255.0, green: 212.0/255.0, blue: 210.0/255.0)

    let darkGray = Color(red: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0)

    
    var body: some View {
        VStack(spacing: 10) {
            
            
            
            Text(value)
                .font(.system(size: 75))
                .foregroundColor(.white)
                .padding(.top, 110)
            
            Spacer()
            Spacer()
            
            
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 15) {
                    ForEach(row, id: \.self) { item in
                        Button(action: {
                            self.handleButtonPress(button: item)
                        }) {
                            Text(item.rawValue)
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                .foregroundColor(self.textColor(item.rawValue))
                                .frame(width: self.buttonWidth(item.rawValue), height: self.buttonHeight(item.rawValue))
                                .background(
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(self.buttonColor(item.rawValue))
                                )
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            Rectangle()
                .foregroundStyle(.black)
                .frame(width: 450, height: 1000)
        )
    }
    
    func handleButtonPress(button: CalcButton) {
        switch button {
                case .add, .subtract, .mutliply, .divide, .equal:
                    if button == .add {
                        self.currentOperation = .add
                        self.runningNumber = Int(self.value) ?? 0
                    }
                    else if button == .subtract {
                        self.currentOperation = .subtract
                        self.runningNumber = Int(self.value) ?? 0
                    }
                    else if button == .mutliply {
                        self.currentOperation = .multiply
                        self.runningNumber = Int(self.value) ?? 0
                    }
                    else if button == .divide {
                        self.currentOperation = .divide
                        self.runningNumber = Int(self.value) ?? 0
                    }
                    else if button == .equal {
                        let runningValue = self.runningNumber
                        let currentValue = Int(self.value) ?? 0
                        switch self.currentOperation {
                        case .add: self.value = "\(runningValue + currentValue)"
                        case .subtract: self.value = "\(runningValue - currentValue)"
                        case .multiply: self.value = "\(runningValue * currentValue)"
                        case .divide: 
                            if currentValue != 0 {
                                self.value = "\(runningValue / currentValue)"
                            } else {
                                self.value = "Error"
                            }
                        case .none:
                            break
                        }
                    }

                    if button != .equal {
                        self.value = "0"
                    }
            
        case .clear:
            self.value = "0"
        case .negative:
            toggleSign()
        case .percent:
            calculatePercentage()
        case .clearMemory:
            clearMemory()
        case .addMemory:
            addToMemory()
        case .removeMemory:
            subtractFromMemory()
        case .recallMemory:
            recallMemory()
        case .decimal:
            if !self.value.contains(",") {
                  self.value += ","
            }
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
        
    }
    
    
    func toggleSign() {
        guard var currentValue = Int(value) else {
            value = "Error"
            return
        }
        
        currentValue *= -1
        value = "\(currentValue)"
    }


    func calculatePercentage() {
        if let currentValue = Double(value) {
            value = "\(currentValue / 100)"
        }
    }
    
    func clearMemory() {
        memoryValue = 0.0
    }
        
    func addToMemory() {
        if let currentValue = Double(value) {
            memoryValue += currentValue
        }
    }
        
    func subtractFromMemory() {
        if let currentValue = Double(value) {
            memoryValue -= currentValue
        }
    }
        
    func recallMemory() {
        value = "\(Int(memoryValue))"
    }
    
    func buttonWidth(_ item: String) -> CGFloat {
        if item == "0" {
            return ((UIScreen.main.bounds.width - (4*12)) / 4) * 2
        } else {
            return 80
        }
    }
    
    func buttonHeight(_ item: String) -> CGFloat {
        if (item == "mc" || item == "m+" || item == "m-" || item == "mr"){
            return 60
        } else {
            return 80
        }
    }
    
    
    
    func buttonColor(_ item: String) -> Color {
        switch item {
        case "=", "÷", "×", "-", "+":
            return .orange
        case "AC", "+/-", "%":
            return lightGray
        default:
            return darkGray
        }
    }
    
    func textColor(_ item: String) -> Color {
        switch item {
            
        case "AC", "+/-", "%":
            return .black
        default:
            return .white
        }
    }
    
}


#Preview {
    ContentView()
}
