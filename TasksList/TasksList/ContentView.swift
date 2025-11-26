//
//  ContentView.swift
//  TasksList
//
//  Created by user279425 on 11/26/25.
//

import SwiftUI

struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String
}

struct ContentView: View {
    
    let examplesTasks: [TaskItem] = [
        TaskItem(title: "TEST", description: "Przerobić rozdział o listach."),
        TaskItem(title: "Wysłanie maila", description: "Send123.")
    ]
    
        var body: some View {
            // Używamy NavigationStack, aby móc później dodać tytuł i nawigację
            NavigationStack {
                
                // 3. Wyświetlanie listy
                List(examplesTasks) { task in
                    // Wyświetlanie każdego elementu listy
                    VStack(alignment: .leading) {
                        Text(task.title)
                            .font(.headline)
                        Text(task.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("Lista Zadań (3.0)")
            }
        }
    }


#Preview {
    ContentView()
}

    

