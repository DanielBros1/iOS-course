//
//  ContentView.swift
//  stripe
//
//  Created by user279425 on 1/9/26.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {

            ProductListView()
                .tabItem {
                    Label("Sklep", systemImage: "cart")
                }

            PurchasedView()
                .tabItem {
                    Label("Zakupy", systemImage: "checkmark")
                }
        }
    }
}

#Preview {
    ContentView()
}
