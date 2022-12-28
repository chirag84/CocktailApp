//
//  ContentView.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var viewModel: ProductViewModel
    @StateObject var favorites = Favorites()
   
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                // Loading indicator
                LoaderView(tintColor: .red, scaleSize: 1.5)
                    .padding(.bottom)
                    .hidden(viewModel.isHideLoader)
                
                VStack(alignment: .leading) {
                    // Product row
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(viewModel.products, id: \.id) { product in
                            NavigationLink(destination: ProductDetailView(product: product), label: {
                                ProductRow(product: product, favorites: favorites)
                            })
                        }
                    }
                }
            }
            .navigationTitle("Product List")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .environmentObject(favorites)
        .environmentObject(viewModel)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(viewModel: ProductViewModel(dataService: APIService()))
    }
}
