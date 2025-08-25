//
//  CartViewModelTest.swift
//  APIchallengeTests
//
//  Created by João Pedro Teixeira de Carvalho on 25/08/25.
//
import Testing

@testable import APIchallenge

struct CartViewModelTest {
    // MARK: Product Service
    
    @Test func fetchAllProducts() async throws {

        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = await CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(!vm.products.isEmpty)
    }
    
    @Test func fetchAllProducts_ShouldFail() async throws {

        // Given
        let productsService = MockProductService(shouldFail: true)
        let favoritesService = MockFavoritesService(shouldFail: true)
        let cartService = MockCartService(shouldFail: true)
        let orderService = MockOrdersService(shouldFail: true)

        let vm = await CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(vm.products.isEmpty)
    }
    
    @Test func fetchCategories() async throws {

        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = await CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(!vm.categories.isEmpty)
    }

    @Test func fetchCategories_ShouldFail() async throws {

        // Given
        let productsService = MockProductService(shouldFail: true)
        let favoritesService = MockFavoritesService(shouldFail: true)
        let cartService = MockCartService(shouldFail: true)
        let orderService = MockOrdersService(shouldFail: true)

        let vm = await CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)

        // When
        await vm.fetch()

        // Then
        await #expect(vm.categories.isEmpty)
    }
    
    // MARK: - Cart Service
    
    @MainActor @Test func addToCart() {
        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)
        
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
        #expect(vm.cartList.isEmpty)
        vm.addToCart(productID: product.id)
        
        // Then
        #expect(vm.cartList.count == 1)
    }
    @MainActor @Test func removeFromCart() {
        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)
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
        vm.addToCart(productID: product.id)
        #expect(vm.cartList.count == 1)
        vm.removeFromCart(productID: product.id, quantity: 2)
        
        // Then
        #expect(vm.cartList.count == 0)
    }
    @MainActor @Test func clearCart() {
        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)
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
        vm.addToCart(productID: product.id)
        #expect(vm.cartList.count == 1)
        vm.clearCart()
        
        // Then
        #expect(vm.cartList.count == 0)
    }
    
    // MARK: - Favorites Service
    
    @MainActor @Test func addToFavorites() {
        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)
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
        vm.addToFavorites(productID: product.id)
        
        // Then
        #expect(!vm.favoritesList.isEmpty)
    }
    
    @MainActor @Test func removeFromFavorites() {
        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)
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
        vm.addToFavorites(productID: product.id)
        #expect(!vm.favoritesList.isEmpty)
        vm.removeFromFavorites(productID: product.id)
        
        // Then
        #expect(vm.favoritesList.isEmpty)
    }

    // MARK: - Orders Service
    @MainActor @Test func addToOrders() {
        // Given
        let productsService = MockProductService()
        let favoritesService = MockFavoritesService()
        let cartService = MockCartService()
        let orderService = MockOrdersService()

        let vm = CartViewModel(APIservice: productsService, favoritesService: favoritesService, cartService: cartService, orderService: orderService)
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
