//
//  ContentView.swift
//  Network
//
//  Created by user279425 on 12/20/25.
//

import SwiftUI
internal import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        TabView {
            CategoryListView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet")
                }

            ProductListView()
                .tabItem {
                    Label("Products", systemImage: "cart")
                }
        }
        .task {
            let persistence = PersistenceController.shared
            persistence.clearAllData()
            await persistence.importFromAPI()
        }

    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext,
                     PersistenceController.shared.container.viewContext)
}
