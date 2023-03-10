//
//  ProductViewModel.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var isHideLoader: Bool = false
    
    let isPostDetail: Bool = false
    private let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
      
        fetchProductList()
    }
    
    func fetchProductList() {
        dataService.getProductList { [weak self] products in
            DispatchQueue.main.async {
                self?.products = products
                self?.isHideLoader = true
            }
        }
    }
}
