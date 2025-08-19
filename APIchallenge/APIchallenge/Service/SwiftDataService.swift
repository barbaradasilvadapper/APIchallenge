//
//  SwiftDataService.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 18/08/25.
//

import Foundation
import SwiftData

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    init() {
        // Change isStoredInMemoryOnly to false if you would like to see the data persistance after kill/exit the app
        self.modelContainer = try! ModelContainer(for: FavoritesList.self, CartList.self, OrderList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
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
    
    func addFavorite(_ favorite: FavoritesList) {
        modelContext.insert(favorite)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addItemtoCart(_ item: CartList) {
        modelContext.insert(item)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addOrder(_ order: OrderList) {
        modelContext.insert(order)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteFavorite(_ favorite: FavoritesList) {
        modelContext.delete(favorite)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteItemtoCart(_ item: CartList) {
        modelContext.delete(item)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
