//
//  CartProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 21/08/25.
//
import Foundation

//@MainActor
protocol CartServiceProtocol {
    var cartList: [CartList] { get }
    func addToCart(productID: Int)
    func removeFromCart(productID: Int, quantity: Int)
    func clearCart()
    func fetchCart() -> [CartList]
}
