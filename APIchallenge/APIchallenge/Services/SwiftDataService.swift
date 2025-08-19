//
//  SwiftDataService.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 18/08/25.
//

import Foundation
import SwiftData

class SwiftDataService: LocalServiceProtocol {
    var cartList: [CartList] {
        fetchCart()
    }
    var favoritesList: [FavoritesList] {
        fetchFavorites()
    }
    var orderList: [OrderList] {
        fetchOrders()
    }
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: FavoritesList.self, CartList.self, OrderList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
    }
    
    func addToCart(product: Product, quantity: Int = 1) {
        let cart = CartList(id: product.id, quantity: quantity)
        modelContext.insert(cart)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    func removeFromCart(product: Product) {
        do {
            let id = product.id
            let descriptor = FetchDescriptor<CartList>(
                predicate: #Predicate { $0.id == id }
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
    
    func addToFavorites(product: Product) {
        let favorite = FavoritesList(id: product.id)
        modelContext.insert(favorite)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    func removeFromFavorites(product: Product) {
        do {
            let id = product.id
            let descriptor = FetchDescriptor<FavoritesList>(
                predicate: #Predicate { $0.id == id }
            )
            if let item = try modelContext.fetch(descriptor).first {
                modelContext.delete(item)
                try modelContext.save()
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchFavorites() -> [FavoritesList] {
        do {
            return try modelContext.fetch(FetchDescriptor<FavoritesList>())
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
    func fetchOrders() -> [OrderList] {
        do {
            return try modelContext.fetch(FetchDescriptor<OrderList>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addToOrder(product: Product) {
        let product = OrderList(id: product.id)
        modelContext.insert(product)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
