//
//  ContentView.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

struct ProductView: View {
    @StateObject var viewModel: ProductViewModel
   
       var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    // Product row
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(viewModel.products, id: \.id) { product in
                                ProductRow(product: product)
                            
                        }
                    }
                }
            }
            .navigationTitle("Product List")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(viewModel: ProductViewModel(dataService: APIService()))
    }
}
