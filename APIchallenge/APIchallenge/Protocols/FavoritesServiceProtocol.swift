//
//  FavoritesProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 21/08/25.
//
import Foundation

@MainActor
protocol FavoritesServiceProtocol {
    var favoritesList: [FavoritesList] { get }
    func addToFavorites(productID: Int)
    func removeFromFavorites(productID: Int)
    func fetchFavorites() -> [FavoritesList]
}
