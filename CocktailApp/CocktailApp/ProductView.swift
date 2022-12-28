//
//  ContentView.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
