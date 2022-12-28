//
//  ProdcutDetailViewModel.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject {
    
    let product: Product
    @Published var isFavourite: Bool = false
    
    init(product: Product) {
        self.product = product
        
        if UserDefaults.standard.object(forKey: product.id) != nil {
            isFavourite = true
        }
    }
}
