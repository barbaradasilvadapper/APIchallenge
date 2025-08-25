//
//  OrdersViewModelTest.swift
//  APIchallengeTests
//
//  Created by João Pedro Teixeira de Carvalho on 25/08/25.
//
import Testing

@testable import APIchallenge

struct OrdersViewModelTest {
    // MARK: Products Service
    @Test func fetchAllProducts() async throws {

        // Given
        let productsService = MockProductService()
        let orderService = MockOrdersService()

        let vm = await OrderViewModel(APIservice: productsService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(!vm.products.isEmpty)
    }
    
    @Test func fetchAllProducts_ShouldFail() async throws {

        // Given
        let productsService = MockProductService(shouldFail: true)
        let orderService = MockOrdersService(shouldFail: true)

        let vm = await OrderViewModel(APIservice: productsService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(vm.products.isEmpty)
    }
    
    @Test func fetchCategories() async throws {

        // Given
        let productsService = MockProductService()
        let orderService = MockOrdersService()

        let vm = await OrderViewModel(APIservice: productsService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(!vm.categories.isEmpty)
    }

    @Test func fetchCategories_ShouldFail() async throws {

        // Given
        let productsService = MockProductService(shouldFail: true)
        let orderService = MockOrdersService(shouldFail: true)

        let vm = await OrderViewModel(APIservice: productsService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(vm.categories.isEmpty)
    }
    
    // MARK: - Orders Service
    @MainActor @Test func addToOrders() {
        // Given
        let productsService = MockProductService()
        let orderService = MockOrdersService()

        let vm = OrderViewModel(APIservice: productsService, orderService: orderService)
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
        vm.addToOrder(productID: product.id)
        
        // Then
        #expect(!vm.orderList.isEmpty)
    }
}
