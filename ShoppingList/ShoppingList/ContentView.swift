//
//  ContentView.swift
//  ShoppingList
//
//  Created by user279425 on 12/13/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var cart = CartViewModel()

    var body: some View {
        TabView {
            ProductListView().tabItem {
                Label("Produkty", systemImage: "list.bullet")
            }
            CartView().tabItem {
                Label("Koszyk", systemImage: "cart")
            }
        }.environmentObject(cart)
    }
}



#Preview {
    ContentView()
}
