//
//  MockFavoritesService.swift
//  APIchallengeTests
//
//  Created by João Pedro Teixeira de Carvalho on 25/08/25.
//
import Foundation

@testable import APIchallenge

class MockFavoritesService: FavoritesServiceProtocol {
    
    var shouldFail: Bool = false
    
    var favoritesList: [APIchallenge.FavoritesList]
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
        self.favoritesList = []
    }
    
    func addToFavorites(productID: Int) {
        favoritesList.append(FavoritesList(id: productID))
    }
    
    func removeFromFavorites(productID: Int) {
        favoritesList.removeAll { $0.id == productID }
    }
    
    func fetchFavorites() -> [APIchallenge.FavoritesList] {
        return favoritesList
    }
}
