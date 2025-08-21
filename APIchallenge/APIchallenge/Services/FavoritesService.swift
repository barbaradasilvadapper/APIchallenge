//
//  FavoritesService.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 21/08/25.
//
import Foundation
import SwiftData

@MainActor
final class FavoritesService: FavoritesServiceProtocol {
    let modelContext: ModelContext

    init() {
        self.modelContext = Persistence.shared.modelContext
    }
    
    var favoritesList: [FavoritesList] {
        fetchFavorites()
    }
    
    func addToFavorites(productID: Int) {
        let favorite = FavoritesList(id: productID)
        modelContext.insert(favorite)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func removeFromFavorites(productID: Int) {
        do {
            let descriptor = FetchDescriptor<FavoritesList>(
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
    
    func fetchFavorites() -> [FavoritesList] {
        do {
            return try modelContext.fetch(FetchDescriptor<FavoritesList>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
