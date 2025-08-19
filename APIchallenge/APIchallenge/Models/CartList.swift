//
//  Cart.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import Foundation
import SwiftData

@Model
class CartList {
    var id: Int
    var quantity: Int
    
    init(id: Int, quantity: Int) {
        self.id = id
        self.quantity = quantity
    }
}
