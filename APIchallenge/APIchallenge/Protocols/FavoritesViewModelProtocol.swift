//
//  FavoritesViewModelProtocol.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 18/08/25.
//

import Foundation

protocol FavoritesViewModelProtocol {
    var favoriteProducts: [Int] { get }
    func fetch() async
}
