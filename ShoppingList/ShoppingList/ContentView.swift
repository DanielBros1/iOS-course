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

//#PreviewProvider
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
