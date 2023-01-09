//
//  Product.swift
//  CocktailApp
//
//  Created by Chirag on 28/12/22.
//

import Foundation

// MARK: - Product
struct ProductList: Codable {
    var products: [Product]?
}

struct Product: Codable {
    var id: String?
    var title: String?
    var citrusId: String?
    var imageURL: String?
    var price: [Price]?
    var brand: String?
    var badges: [String]?
    var ratingCount: Float?
    var messages: Messages?
    var isAddToCartEnable: Bool?
    var addToCartButtonText: String?
}

struct Messages: Codable {
    var secondaryMessage: String?
}

struct Price: Codable {
    var message: String?
    var value: Double?
    var isOfferPrice: Bool?
}

struct PurchaseType: Codable {
    var purchaseType, displayName: String?
    var unitPrice: Double?
    var minQtyLimit, maxQtyLimit, cartQty: Int?
}
