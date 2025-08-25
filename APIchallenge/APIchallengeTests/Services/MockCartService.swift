//
//  MockCartService.swift
//  APIchallengeTests
//
//  Created by João Pedro Teixeira de Carvalho on 25/08/25.
//
import Foundation

@testable import APIchallenge

class MockCartService: CartServiceProtocol {
    var shouldFail: Bool = false
    var cartList: [APIchallenge.CartList]
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
        self.cartList = []
    }
    
    func addToCart(productID: Int) {
        cartList.append(CartList(id: productID, quantity: 1))
    }
    
    func removeFromCart(productID: Int, quantity: Int) {
        cartList.removeAll { $0.id == productID }
    }
    
    func clearCart() {
        cartList.removeAll()
    }
    
    func fetchCart() -> [APIchallenge.CartList] {
        return cartList
    }
    
    
    
    
    
}
