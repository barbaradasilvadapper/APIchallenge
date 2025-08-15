//
//  PersistenceProtocol.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import Foundation

protocol PersistenceProtocol {
    func addFavorite(id: Int)
    func removeFavorite(id: Int)
    func isFavorite(id: Int) -> Bool
    
    func addCart(id: Int)
    func removeCart(id: Int)
    func isCart(id: Int) -> Bool

    var favorites: [Int] { get }
    var cart: [Int] { get }
}
