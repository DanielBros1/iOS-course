//
//  APIService.swift
//  Network
//
//  Created by user279425 on 12/21/25.
//

import Foundation

class APIService {

    static let shared = APIService()

    func fetchCategories() async throws -> [APICategory] {
        return [
            APICategory(id: 1, name: "Phones"),
            APICategory(id: 2, name: "Electronics")
        ]
    }

    func fetchProducts() async throws -> [APIProduct] {
        return [
            APIProduct(id: 1, name: "iPhone", price: 5799, categoryId: 1),
            APIProduct(id: 2, name: "MacBook", price: 9499, categoryId: 1),
            APIProduct(id: 3, name: "AirPods", price: 1099, categoryId: 2)
        ]
    }
}
