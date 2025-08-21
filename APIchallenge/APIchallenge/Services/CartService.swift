//
//  CartService.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 21/08/25.
//
import Foundation
import SwiftData

final class CartService: CartServiceProtocol {
    let modelContext: ModelContext

    init() {
        self.modelContext = Persistence.shared.modelContext
    }
    
    var cartList: [CartList] {
        fetchCart()
    }
    
    func addToCart(productID: Int) {
        let cart = CartList(id: productID, quantity: 1)
        modelContext.insert(cart)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func removeFromCart(productID: Int, quantity: Int) {
        do {
            let descriptor = FetchDescriptor<CartList>(
                predicate: #Predicate { $0.id == productID }
            )
            if let item = try modelContext.fetch(descriptor).first {
                modelContext.delete(item)
                try modelContext.save()
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func clearCart() {
        do {
            let items = try modelContext.fetch(FetchDescriptor<CartList>())
            items.forEach { modelContext.delete($0) }
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchCart() -> [CartList] {
        do {
            return try modelContext.fetch(FetchDescriptor<CartList>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
