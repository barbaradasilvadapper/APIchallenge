//
//  ViewModelProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import SwiftUI
import SwiftData

protocol ViewModelProtocol {
    // API Service
    var products: [Int: Product] { get }
    var categories: [Category] { get }
    var isLoading: Bool { get }
    var defaultProduct: Product { get }
    func fetch() async
    
    // Cart Service
    var cartList: [CartList] { get }
    func addToCart(productID: Int)
    func removeFromCart(productID: Int, quantity: Int)
    func clearCart()

    // Favorites Service
    var favoritesList: [FavoritesList] { get }
    func addToFavorites(productID: Int)
    func removeFromFavorites(productID: Int)
    
    // Orders Service
    var orderList: [OrderList] { get }
    func addToOrder(productID: Int)
}
