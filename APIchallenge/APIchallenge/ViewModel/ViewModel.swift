//
//  TestViewModel.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 13/08/25.
//
import SwiftData
import SwiftUI

@Observable
class ViewModel: ViewModelProtocol {
    
    init(APIservice: APIServiceProtocol, dataSource: any LocalServiceProtocol) {
        self.service = APIservice
        self.dataSource = dataSource
        self.cartList = dataSource.fetchCart()
        self.orderList = dataSource.fetchOrders()
        self.favoritesList = dataSource.fetchFavorites()
    }
    
    // MARK: - API Service
    private let service: any APIServiceProtocol

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

    func fetchAllProducts() async {
        do {
            products = try await service.fetchAllProducts()
        } catch {
            print("Error fetching products: \(error.localizedDescription)")
        }
    }

    func fetchCategories() async {
        do {
            categories = try await service.fetchAllCategories()
        } catch {
            print("Error fetching categories: \(error.localizedDescription)")
        }
    }

    // MARK: - Local Service
    private let dataSource: any LocalServiceProtocol

    var cartList: [CartList]
    var favoritesList: [FavoritesList]
    var orderList: [OrderList]

    func addToCart(productID: Int, quantity: Int = 1) {
        let product = products[productID] ?? defaultProduct
        dataSource.addToCart(product: product, quantity: quantity)
        cartList = dataSource.fetchCart()
    }

    func removeFromCart(productID: Int, quantity: Int) {
        let product = products[productID] ?? defaultProduct
        dataSource.removeFromCart(product: product)
        cartList = dataSource.fetchCart()
    }

    func addToFavorites(productID: Int) {
        let product = products[productID] ?? defaultProduct
        dataSource.addToFavorites(product: product)
        favoritesList = dataSource.fetchFavorites()
    }

    func removeFromFavorites(productID: Int) {
        let product = products[productID] ?? defaultProduct
        dataSource.removeFromFavorites(product: product)
        favoritesList = dataSource.fetchFavorites()
    }
    
    func clearCart() {
        cartList = []
        dataSource.clearCart()
    }
    
    func addToOrder(productID: Int) {
        let product = products[productID] ?? defaultProduct
        dataSource.addToOrder(product: product)
        orderList = dataSource.fetchOrders()
    }
    
}
