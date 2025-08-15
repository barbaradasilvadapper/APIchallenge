//
//  TestViewModel.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import Foundation

@Observable
class ViewModel: ViewModelProtocol {
    var products: [Int: Product] = [:]
    var categories: [Category] = []
    var isLoading: Bool = true
    let defaultProduct = Product(id: -1, title: "Default product", description: "default description", category: .beauty, price: -1, thumbnail: "", isFavourite: false)
    
    func fetch() async {
        isLoading = true
        await fetchAllProducts()
        await fetchCategories()
        isLoading = false
    }
    
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
    
    func fetchCategories() async {
        isLoading = true
        
        do {
            categories = try await service.fetchAllCategories()
        } catch {
            print("Error fetching categories: \(error.localizedDescription)")
        }
        
        print(categories)
        
        isLoading = false
    }
    
}
