//
//  ProductDetailView.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProdcutDetailViewModel
    
    init(product: Product) {
        viewModel = ProdcutDetailViewModel(product: product)
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8.0) {
            HStack() {
                Spacer()
            }
            // Product image
            HStack(alignment: .top) {
                KFImage(URL(string: viewModel.product.imageURL ?? ""))
                    .placeholder {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.largeTitle)
                            .opacity(0.3)
                    }
                    .resizable()
                    .frame(height: 300).frame(maxWidth: .infinity)
                    .background(Color.clear)
                    .padding()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart")
                })
                
            }
            
            // Title
            Text(viewModel.product.title)
                .font(.headline)
            
            
            // Price
            Text(String("$\(viewModel.product.price?.first?.value ?? 0)"))
                .font(.subheadline)
                .foregroundColor(.red.opacity(0.6))
            
            // Add to cart & Favourites
            HStack(alignment: .center, spacing: 5){
                RatingView(rating: Double(viewModel.product.ratingCount ?? 0))
                
                Text(String(viewModel.product.ratingCount ?? 0))
                    .font(Font.system(size: 12, weight: .medium))
                
            }
            Spacer()
        }
        .padding(16)
        .background(Color.init(red: 250/255, green: 250/255, blue: 250/255))
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailView(product: Product(id: "", title: ""))
        }
        
    }
}