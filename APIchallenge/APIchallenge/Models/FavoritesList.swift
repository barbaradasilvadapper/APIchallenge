//
//  Favorites.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import Foundation
import SwiftData

@Model
class FavoritesList: Identifiable {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}
