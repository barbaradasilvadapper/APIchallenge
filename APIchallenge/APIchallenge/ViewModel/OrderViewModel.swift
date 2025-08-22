//
//  OrderViewModel.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 22/08/25.
//

import Foundation

@Observable
final class OrderViewModel: OrdersVIewModelProtocol {
    init(APIservice: any APIServiceProtocol, orderService: any OrdersServiceProtocol) {
        self.productService = APIservice
        self.ordersService = orderService
    }
    
    // MARK: - Product Service
    var productService: any APIServiceProtocol
    
    var products: [Int : Product] = [:]
    var categories: [Category] = []
    var isLoading: Bool = true
    
    var defaultProduct: Product = Product(id: -1, title: "Default product", description: "default description", category: .beauty, price: -1, thumbnail: "", isFavourite: false)
    
    func fetch() async {
        isLoading = true
        await fetchAllProducts()
        await fetchCategories()
        isLoading = false
    }
    
    func fetchAllProducts() async {
        do {
            products = try await productService.fetchAllProducts()
        } catch {
            print("Error fetching products: \(error.localizedDescription)")
        }
    }

    func fetchCategories() async {
        do {
            categories = try await productService.fetchAllCategories()
        } catch {
            print("Error fetching categories: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Order Service
    var ordersService: any OrdersServiceProtocol

    var orderList: [OrderList] {
        ordersService.fetchOrders()
    }

    func addToOrder(productID: Int) {
        ordersService.addToOrder(productID: productID)
    }
}
