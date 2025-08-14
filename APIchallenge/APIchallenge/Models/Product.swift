//
//  Product.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
    
    var productsDict: [Int: Product] {
        products.reduce(into: [:]) { result, product in
            result[product.id] = product
        }
    }
}

struct Product: Decodable {
    let id: Int
    let title: String
    let description: String
    let category: Category
    let price: Double
    let thumbnail: String
    
    var isFavourite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case category
        case price
        case tags
        case thumbnail
    }
}
