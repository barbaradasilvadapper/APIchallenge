//
//  FavortieProducts.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Persistence: Identifiable, PersistenceProtocol {

    @Attribute var favorites: [Int]
    @Attribute var cart: [Int]

    init(favorites: [Int] = [], cart: [Int] = []) {
        self.favorites = favorites
        self.cart = cart
    }

    func addFavorite(id: Int) {
        if !favorites.contains(id) {
            self.favorites.append(id)
        }
    }

    func removeFavorite(id: Int) {
        if let index = favorites.firstIndex(of: id) {
            favorites.remove(at: index)
        }
    }

    func isFavorite(id: Int) -> Bool {
        favorites.contains(id)
    }

    func addCart(id: Int) {
        if !cart.contains(id) {
            self.cart.append(id)
        }
    }

    func removeCart(id: Int) {
        if let index = cart.firstIndex(of: id) {
            cart.remove(at: index)
        }
    }

    func isCart(id: Int) -> Bool {
        cart.contains(id)
    }
}
