//
//  CategoryListVIew.swift
//  Network
//
//  Created by user279425 on 12/21/25.
//

import SwiftUI
internal import CoreData

struct CategoryListView: View {

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \CategoryEntity.name, ascending: true)],
        animation: .default
    )
    private var categories: FetchedResults<CategoryEntity>

    var body: some View {
        NavigationView {
            List(categories) { category in
                Text(category.name ?? "No name")
            }
            .navigationTitle("Categories")
        }
    }
}
