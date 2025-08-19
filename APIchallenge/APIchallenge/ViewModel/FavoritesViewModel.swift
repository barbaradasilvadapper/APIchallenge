//
//  FavoritesViewModel.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 18/08/25.
//

import Foundation

@Observable
class FavoritesViewModel: FavoritesViewModelProtocol {
    @Published var favoriteProducts: [Int] = []
    
    private let service: SwiftDataService
    
    init(service: SwiftDataService) {
        self.service = service
    }
    
    func fetch() {
        let favorites = service.fetchFavorites()
        self.favoriteProducts = favorites.map { $0.id }
    }
    
    func addFavorite(id: Int) {
        let favorite = FavoritesList(id: id)
        service.addFavorite(favorite)
        fetch()
    }
    
    func removeFavorite(id: Int) {
        if let favorite = service.fetchFavorites().first(where: { $0.id == id }) {
            service.deleteFavorite(favorite)
            fetch()
        }
    }
    
    func isFavorite(id: Int) -> Bool {
        favoriteProducts.contains(id)
    }
}
