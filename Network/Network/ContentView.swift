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
        Text("Network app running")
            .padding()
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext,
                     PersistenceController.shared.container.viewContext)
}
