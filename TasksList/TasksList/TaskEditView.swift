//
//  TaskEditView.swift
//  TasksList
//
//  Created by user279425 on 11/26/25.
//

import UIKit
import SwiftUI

struct TaskEditView: View {
    @Binding var task: TaskItem
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("Task title", text: $task.title)
                .font(.title)
            // Pole tekstowe do zmiany opisu
            TextEditor(text: $task.description)
                .frame(height: 150)
                .border(Color.gray.opacity(0.2))
            
            Toggle("Zadanie ukończone", isOn: $task.isCompleted)
                .tint(.green)
        }
        .navigationTitle("Edytuj Zadanie")
        .toolbar {
            Button("Gotowe") {
                dismiss()
            }
        }
    }
}
