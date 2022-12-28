//
//  View+Extension.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import SwiftUI

extension View {
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
