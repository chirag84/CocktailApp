//
//  FavouriteView.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

struct FavouriteView: View {
    
    @StateObject var favorites = Favorites()
    @EnvironmentObject var viewModel: ProductViewModel
    
    var body: some View {
     NavigationView {
         ZStack {
             Color.white.edgesIgnoringSafeArea(.all)
             VStack(alignment: .leading) {
                 // Product row
                 ScrollView(.vertical, showsIndicators: false) {
                     ForEach(viewModel.products, id: \.id) { product in
                         NavigationLink(destination: ProductDetailView(product: product), label: {
                             if UserDefaults.standard.object(forKey: product.id ?? "0") != nil {
                                 ProductRow(product: product, favorites: favorites)
                             }
                             
                         })
                     }
                 }
             }
         }
         .navigationTitle("Favourites")
         .navigationBarTitleDisplayMode(.inline)

     }
     
 }
}
