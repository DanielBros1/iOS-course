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
        ["C", "S", "%", "/"],
        ["1", "2", "3", "+"]
    ]
    
    
    var body: some View {
            VStack(spacing: 12) {
                Spacer()
                
                HStack {
                    Spacer()
                    Text(display)
                        .foregroundColor(.white)
                        .padding()
                    }
                    .background(Color.black)
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { symbol in
                            CalculatorButton(label: symbol) {
                                buttonPressed(symbol)
                            }
                        }
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
        }
    
    private func buttonPressed(_ symbol: String) {
        switch symbol {
        case "0"..."9", ".":
            numberPressed(symbol)
        case "+", "/":
            operationPressed(symbol)
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
}

#Preview {
    ContentView()
}
