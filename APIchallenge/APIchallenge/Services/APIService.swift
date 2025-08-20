//
//  Service.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

class APIService: APIServiceProtocol {
    
    private let baseURL: String = "https://dummyjson.com"
    
    func fetchAllProducts() async throws -> [Int: Product] {
        let urlString = "\(baseURL)/products?limit=0"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
        
        return response.productsDict
    }
    
    func fetchAllCategories() async throws -> [Category] {
        let urlString = "\(baseURL)/products/category-list"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let slugs = try JSONDecoder().decode([String].self, from: data)
        return slugs.compactMap(Category.init(fromRawValue:))
    }
    
    
}
