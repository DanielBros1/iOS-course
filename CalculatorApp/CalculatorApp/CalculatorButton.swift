//
//  CalculatorButton.swift
//  iOSCoursre
//
//  Created by user279425 on 11/9/25.
//

import SwiftUI

struct CalculatorButton: View {
    let label: String
    let action: () -> Void
    
    var backgroundColor: Color {
        switch label {
        case "AC": return .red
        case "+", "−", "×", "÷", "=", "^": return .orange
        default: return .gray
        }
    }
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: 32, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(backgroundColor)
                .cornerRadius(16)
        }
    }
}
