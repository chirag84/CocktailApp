//
//  APIService.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import Foundation

protocol DataService {
    func getProductList(completion: @escaping ([Product]) -> Void)
}

final class APIService: DataService {
    func getProductList(completion: @escaping ([Product]) -> Void) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328") else {
             return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            let product = try? JSONDecoder().decode(ProductList.self, from: data!)
               
            completion(product?.products ?? [Product()])
        }.resume()
        
    }

}

final class MockDataService: DataService {
    func getProductList(completion: @escaping ([Product]) -> Void) {
        
        let response = ProductList(products: [
            Product(id: "23124", title: "Diamond Label Shiraz", price: [Price(value: 9.4)], ratingCount: 4),
            Product(id: "144469", title: "Shiraz", price: [Price(value: 17.95)], ratingCount: 4.3364),
        ])
        
        completion(response.products ?? [Product()])
    }
    
    
}
