//
//  LocalServiceProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 19/08/25.
//
import SwiftUI
import SwiftData

protocol LocalServiceProtocol {
    var cartList: [CartList] { get }
    var favoritesList: [FavoritesList] { get }
    func addToCart(product: Product, quantity: Int)
    func removeFromCart(product: Product)
    func addToFavorites(product: Product)
    func removeFromFavorites(product: Product)
    func fetchFavorites() -> [FavoritesList]
    func fetchCart() -> [CartList]
}
