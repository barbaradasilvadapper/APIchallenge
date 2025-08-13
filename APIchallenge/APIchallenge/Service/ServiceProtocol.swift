//
//  ServiceProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

protocol ServiceProtocol {
    func fetchAllProducts() async throws -> [Product]
    func fetchAllCategories() async throws -> [String]
}
