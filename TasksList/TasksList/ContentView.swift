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
    var isCompleted: Bool = false
}

struct ContentView: View {
    
    @State private var tasks: [TaskItem] = [
            TaskItem(title: "Przyjsc na zajecia", description: "iOS 12:00"),
            TaskItem(title: "Zestaw 1", description: "Metoda RSA"),
            TaskItem(title: "Praca magisterska", description: "Przeczytac rozdzial 3"),

        ]
    
    var body: some View {
            NavigationStack {
                
                List {
                    ForEach($tasks) { $task in
                        NavigationLink {
                            TaskEditView(task: $task)
                        } label: {
                            HStack {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                                    .onTapGesture {
                                        task.isCompleted.toggle()
                                    }
                                    .padding(.trailing, 8)
                                
                                // Tytuł i opis
                                VStack(alignment: .leading) {
                                    Text(task.title)
                                    Text(task.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Lista Zadań")
            }
        }
    }

    #Preview {
        ContentView()
    }
