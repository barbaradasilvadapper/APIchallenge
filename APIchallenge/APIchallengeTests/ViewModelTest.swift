//
//  ViewModelTest.swift
//  APIchallengeTests
//
//  Created by Bárbara Dapper on 20/08/25.
//

import Testing

@testable import APIchallenge

struct ViewModelTest {

    // MARK: API

    @Test func fetchAllProducts() async throws {

        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )

        // When
        await viewModel.fetch()

        // Then
        #expect(!viewModel.products.isEmpty)
    }

    @Test func fetchAllProducts_ShouldFail() async throws {

        // Given
        let service = MockProductService(shouldFail: true)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )

        // When
        await viewModel.fetch()

        // Then
        #expect(viewModel.products.isEmpty)
    }
    
    @Test func fetchCategories() async throws {

        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )

        // When
        await viewModel.fetch()

        // Then
        #expect(!viewModel.categories.isEmpty)
    }

    @Test func fetchCategories_ShouldFail() async throws {

        // Given
        let service = MockProductService(shouldFail: true)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )

        // When
        await viewModel.fetch()

        // Then
        #expect(viewModel.categories.isEmpty)
    }
    

    // MARK: Local
    @Test func addToCart() {
        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )
        let product = Product(
            id: 1,
            title: "Test",
            description: "Test desc",
            category: .beauty,
            price: 10,
            thumbnail: "",
            isFavourite: false
        )
        
        // When
        #expect(viewModel.cartList.isEmpty)
        viewModel.addToCart(productID: product.id, quantity: 2)
        
        // Then
        #expect(viewModel.cartList.count == 1)
    }
    @Test func removeFromCart() {
        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )
        let product = Product(
            id: 1,
            title: "Test",
            description: "Test desc",
            category: .beauty,
            price: 10,
            thumbnail: "",
            isFavourite: false
        )

        // When
        viewModel.addToCart(productID: product.id, quantity: 2)
        #expect(viewModel.cartList.count == 1)
        viewModel.removeFromCart(productID: product.id, quantity: 2)
        
        // Then
        #expect(viewModel.cartList.count == 0)
    }
    @Test func clearCart() {
        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )
        let product = Product(
            id: 1,
            title: "Test",
            description: "Test desc",
            category: .beauty,
            price: 10,
            thumbnail: "",
            isFavourite: false
        )

        // When
        viewModel.addToCart(productID: product.id, quantity: 2)
        #expect(viewModel.cartList.count == 1)
        viewModel.clearCart()
        
        // Then
        #expect(viewModel.cartList.count == 0)
    }
    
    @Test func addToFavorites() {
        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )
        let product = Product(
            id: 1,
            title: "Test",
            description: "Test desc",
            category: .beauty,
            price: 10,
            thumbnail: "",
            isFavourite: false
        )

        // When
        viewModel.addToFavorites(productID: product.id)
        
        // Then
        #expect(!viewModel.favoritesList.isEmpty)
    }
    @Test func removeFromFavorites() {
        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )
        let product = Product(
            id: 1,
            title: "Test",
            description: "Test desc",
            category: .beauty,
            price: 10,
            thumbnail: "",
            isFavourite: false
        )

        // When
        viewModel.addToFavorites(productID: product.id)
        #expect(!viewModel.favoritesList.isEmpty)
        viewModel.removeFromFavorites(productID: product.id)
        
        // Then
        #expect(viewModel.favoritesList.isEmpty)
    }
    
    @Test func addToOrders() {
        // Given
        let service = MockProductService(shouldFail: false)
        let viewModel = ViewModel(
            APIservice: service,
            dataSource: MockLocalService()
        )
        let product = Product(
            id: 1,
            title: "Test",
            description: "Test desc",
            category: .beauty,
            price: 10,
            thumbnail: "",
            isFavourite: false
        )

        // When
        viewModel.addToOrder(productID: product.id)
        
        // Then
        #expect(!viewModel.orderList.isEmpty)
    }
    
}
