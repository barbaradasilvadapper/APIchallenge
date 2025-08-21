//
//  MockLocalService.swift
//  APIchallengeTests
//
//  Created by Bárbara Dapper on 20/08/25.
//

import Foundation
@testable import APIchallenge

class MockLocalService: LocalServiceProtocol {
    
    var shouldFail: Bool = false
    var cartList: [APIchallenge.CartList]
    var favoritesList: [APIchallenge.FavoritesList]
    var orderList: [APIchallenge.OrderList]
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
        self.cartList = []
        self.favoritesList = []
        self.orderList = []
    }
    
    func addToCart(product: APIchallenge.Product, quantity: Int) {
        guard !shouldFail else { return }
        cartList.append(CartList(id: product.id, quantity: quantity))
    }

    func removeFromCart(product: APIchallenge.Product) {
        cartList.removeAll { $0.id == product.id }
    }

    func clearCart() {
        cartList.removeAll()
    }

    func addToFavorites(product: APIchallenge.Product) {
        favoritesList.append(FavoritesList(id: product.id))
    }

    func removeFromFavorites(product: APIchallenge.Product) {
        favoritesList.removeAll { $0.id == product.id }
    }

    func addToOrder(product: APIchallenge.Product) {
        orderList.append(OrderList(id: product.id))
    }

    func fetchFavorites() -> [APIchallenge.FavoritesList] {
        return favoritesList
    }

    func fetchCart() -> [APIchallenge.CartList] {
        return cartList
    }

    func fetchOrders() -> [APIchallenge.OrderList] {
        return orderList
    }
    
}
