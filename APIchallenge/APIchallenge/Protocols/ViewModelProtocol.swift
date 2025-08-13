//
//  ViewModelProtocol.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

protocol ViewModelProtocol {
    var products: [Int: Product] { get }
    var isLoading: Bool { get }
    func fetchAllProducts() async
}
