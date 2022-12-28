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

class APIService: DataService {
    func getProductList(completion: @escaping ([Product]) -> Void) {
        
        guard let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328") else {
             return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            let product = try? JSONDecoder().decode(ProductList.self, from: data!)
               
            completion(product?.products ?? [Product(id: "0", title: "")])
        }.resume()
        
    }

}
