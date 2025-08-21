//
//  ViewModelProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import SwiftUI
import SwiftData

@MainActor
protocol ViewModelProtocol {
    // API Service
    var productService: any APIServiceProtocol { get }
    var products: [Int: Product] { get }
    var categories: [Category] { get }
    var isLoading: Bool { get }
    var defaultProduct: Product { get }
    func fetch() async
    
    // Cart Service
    var cartService: any CartServiceProtocol { get }
    var cartList: [CartList] { get }
    func addToCart(productID: Int)
    func removeFromCart(productID: Int, quantity: Int)
    func clearCart()
    var productCount: [(Product, Int)] { get }

    // Favorites Service
    var favoritesService: any FavoritesServiceProtocol { get }
    var favoritesList: [FavoritesList] { get }
    func addToFavorites(productID: Int)
    func removeFromFavorites(productID: Int)
    
    // Orders Service
    var orderList: [OrderList] { get }
    func addToOrder(productID: Int)
}
