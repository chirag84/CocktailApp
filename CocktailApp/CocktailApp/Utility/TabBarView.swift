//
//  TabBarView.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            ProductView(viewModel: ProductViewModel(dataService: APIService()))
                .tabItem {
                    Label("Product", systemImage: "house.fill")
                }
                .tag(0)
            
            FavouriteView().environmentObject(ProductViewModel(dataService: APIService()))
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
                .tag(1)
        }
        .accentColor(.black)
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


