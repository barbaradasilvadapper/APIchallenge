//
//  ServiceProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

protocol APIServiceProtocol {
    func fetchAllProducts() async throws -> [Int: Product]
    func fetchAllCategories() async throws -> [Category]
}
