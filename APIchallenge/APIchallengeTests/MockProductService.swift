//
//  MockProductService.swift
//  APIchallengeTests
//
//  Created by Bárbara Dapper on 20/08/25.
//

import Foundation
@testable import APIchallenge

class MockProductService: APIServiceProtocol {
    
    var shouldFail: Bool = false
    private var product: Product
    private var categories: [APIchallenge.Category]
    
    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
        self.product = Product(id: 0, title: "Default product", description: "default description", category: .beauty, price: -1, thumbnail: "", isFavourite: false)
        self.categories = [.beauty]
    }
    
    func fetchAllProducts() async throws -> [Int : APIchallenge.Product] {
        if shouldFail {
            throw NSError(domain: #function, code: 1)
        } else {
            return [product.id: product]
        }
    }
    
    func fetchAllCategories() async throws -> [APIchallenge.Category] {
        if shouldFail {
            throw NSError(domain: #function, code: 2)
        } else {
            return categories
        }
    }
    
    
}
