//
//  CalculatorButton.swift
//  iOSCoursre
//
//  Created by user279425 on 11/9/25.
//

import SwiftUI

struct CalculatorButton: View {
    let label: String
    let size: CGFloat
    let action: () -> Void
    
    var backgroundColor: Color {
        switch label {
        case "C": return .red
        case "+", "−", "×", "÷", "=", "^": return .orange
        default: return .gray
        }
    }
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.system(size: size * 0.45))
                .foregroundColor(.white)
                .frame(width: size, height: size)
                .background(Color.orange)
                .cornerRadius(size / 2)
        }
    }
}
