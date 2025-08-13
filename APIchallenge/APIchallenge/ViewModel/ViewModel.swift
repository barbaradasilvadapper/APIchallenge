//
//  TestViewModel.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

@Observable
class ViewModel: ViewModelProtocol {
    var products: [Product] = []
    var isLoading: Bool = true
    
    private let service: ServiceProtocol

    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchAllProducts() async {
        isLoading = true
        
        do {
            products = try await service.fetchAllProducts()
        } catch {
            print("Error fetching products: \(error.localizedDescription)")
        }
        
        isLoading = false
    }
}
