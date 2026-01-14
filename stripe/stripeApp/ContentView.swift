//
//  ContentView.swift
//  stripe
//
//  Created by user279425 on 1/9/26.
//

import SwiftUI

struct ContentView: View {

    let product = Product(
        id: UUID(),
        name: "Premium Subscription",
        price: 1999
    )

    var body: some View {
        PaymentView(
            viewModel: PaymentViewModel(product: product)
        )
    }
}


#Preview {
    ContentView()
}
