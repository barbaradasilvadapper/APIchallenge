//
//  Service.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

class Service: ServiceProtocol {
    
    private let baseURL: String = "https://dummyjson.com"
    
    func fetchAllProducts() async throws -> [Product] {
        let urlString = "\(baseURL)/products"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
        
        return response.products
    }
    
    func fetchProductBy(id: Int) async throws -> Product? {
        let urlString = "\(baseURL)/products/\(id)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Product.self, from: data)
        
        return response
    }
    
    func fetchProductsBy(name: String) async throws -> [Product] {
        return []
    }
    
    func fetchProductsBy(category: String) async throws -> [Product] {
        return []
    }
    
    func fetchAllCategories() async throws -> [String] {
        return []
    }
    
    
}
