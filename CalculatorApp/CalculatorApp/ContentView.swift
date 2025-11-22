//
//  ContentView.swift
//  iOSCoursre
//
//  Created by user279425 on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var currentOperation: String? = nil
    @State private var firstValue: Double? = nil
    @State private var userIsTyping = false
    
    let buttons: [[String]] = [
        ["C", "+/-", "%", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "−"],
        ["1", "2", "3", "+"],
        ["0", ".", "=", "^"]
    ]
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: geo.size.height * 0.015) {
                Spacer()
                
                HStack {
                    Spacer()
                    Text(display)
                        .font(.system(size: geo.size.width * 0.12))
                        .foregroundColor(.white)
                        .padding()
                }
                .background(Color.black)
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: geo.size.width * 0.03) {
                        ForEach(row, id: \.self) { symbol in
                            CalculatorButton(
                                label: symbol,
                                size: geo.size.width * 0.18
                            ) {
                                buttonPressed(symbol)
                            }
                        }
                    }
                }
            }
            .padding()
            .background(Color.gray)
        }
    }
    
    private func buttonPressed(_ symbol: String) {
        switch symbol {
        case "0"..."9", ".":
            numberPressed(symbol)
        case "+", "−", "×", "÷", "^":
            operationPressed(symbol)
        case "=":
            calculateResult()
        case "C":
            clear()
        case "+/-":
            toggleSign()
        case "%":
            applyPercent()
        default:
            break
        }
    }
    
    
    private func numberPressed(_ num: String) {
        if !userIsTyping {
            display = (num == ".") ? "0." : num
            userIsTyping = true
        } else {
            if num == "." && display.contains(".") { return }
            display += num
        }
    }
    private func operationPressed(_ op: String) {
        firstValue = Double(display)
        currentOperation = op
        userIsTyping = false
    }
    
    private func calculateResult() {
        guard let op = currentOperation,
              let first = firstValue,
              let second = Double(display) else { return }
        
        var result: Double = first
        
        switch op {
        case "+": result = first + second
        case "−": result = first - second
        case "×": result = first * second
        case "÷": result = second != 0 ? first / second : 0
        case "^": result = pow(first, second)
        default: break
        }
        
        display = format(result)
        firstValue = result
        userIsTyping = false
    }
    
    private func clear() {
        display = "0"
        currentOperation = nil
        firstValue = nil
        userIsTyping = false
    }
    
    private func toggleSign() {
        if let value = Double(display) {
            display = format(-value)
        }
    }
    
    private func applyPercent() {
        if let value = Double(display) {
            display =  format( value / 100)
        }
    }
    
    private func format(_ value: Double) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(value))
        } else {
            return String(format: "%.4f", value)
        }
    }
}

#Preview {
    ContentView()
}
