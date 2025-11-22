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
    

    var body: some View {
        Button(action: action) {
            Text(label)
                .foregroundColor(.white)
                .cornerRadius(16)
        }
    }
}
