//
//  Favorites.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

class Favorites: ObservableObject {
    private var products: Set<String>
    
    init() {
        products = []
    }

    func contains(_ product: Product) -> Bool {
        products.contains(product.id ?? "0")
    }

    func add(_ product: Product) {
        objectWillChange.send()
        products.insert(product.id ?? "0")
     
    }

    func remove(_ product: Product) {
        objectWillChange.send()
        products.remove(product.id ?? "0")
       
    }
}
