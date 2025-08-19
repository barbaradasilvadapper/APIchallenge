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
    
    // Local service
    var cartList: [CartList] { get }
    var favoritesList: [FavoritesList] { get }
    func addToCart(productID: Int, quantity: Int)
    func removeFromCart(productID: Int, quantity: Int)
    func addToFavorites(productID: Int)
    func removeFromFavorites(productID: Int)
}
