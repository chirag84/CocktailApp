//
//  ProductRow.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI
import Kingfisher

struct ProductRow: View {
    
    var product: Product
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                
                // Product image
                KFImage(URL(string: product.imageURL ?? ""))
                    .placeholder {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.largeTitle)
                            .opacity(0.3)
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .shadow(color: .gray, radius: 6.0, x: 4.0, y: 4.0)
                    .background(Color.clear)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Title
                    Text(product.title)
                        .font(.headline)
                    
                    // Price
                    Text(String("$\(product.price?.first?.value ?? 0)"))
                        .font(.subheadline)
                        .foregroundColor(.red.opacity(0.6))
                    
                    // Add to cart & Favourites
                    HStack(alignment: .center, spacing: 30){
                        Button(action: {
                            print("Added to Card")
                        }, label: {
                            Text("Add to Cart")
                                .padding(8)
                                .font(.caption)
                                .background(Color.red.opacity(0.6))
                                .foregroundColor(Color.white)
                                .cornerRadius(4.0)
                        })
                        
                        if UserDefaults.standard.object(forKey: product.id) != nil {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
            
        }
        .padding(16)
        .background(Color.init(red: 250/255, green:  250/255, blue:  250/255))
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ProductRow(product: Product(id: "23124", title: "Diamond Label Shiraz", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM"))
        }
        
    }
}

