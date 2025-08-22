//
//  FavoritesViewModel.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 22/08/25.
//
import Foundation

@Observable
final class FavoritesViewModel: FavoritesViewModelProtocol {
    init(APIservice: any APIServiceProtocol, favoritesService: any FavoritesServiceProtocol, cartService: any CartServiceProtocol) {
        self.productService = APIservice
        self.favoritesService = favoritesService
        self.cartService = cartService
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
    
    // MARK: - Cart Service
    let cartService: any CartServiceProtocol
    
    var cartList: [CartList] {
        cartService.cartList
    }
    
    func addToCart(productID: Int) {
        cartService.addToCart(productID: productID)
    }

    func removeFromCart(productID: Int, quantity: Int) {
        cartService.removeFromCart(productID: productID, quantity: quantity)
    }
    
    func clearCart() {
        cartService.clearCart()
    }
    
    // MARK: - Favorites Service
    var favoritesService: any FavoritesServiceProtocol
    
    var favoritesList: [FavoritesList] {
        favoritesService.favoritesList
    }

    func addToFavorites(productID: Int) {
        if favoritesList.filter({ $0.id == productID }).count > 0 {
            removeFromFavorites(productID: productID)
            return
        }
        
        favoritesService.addToFavorites(productID: productID)
        
        products[productID]?.isFavourite.toggle()
    }
    
    func removeFromFavorites(productID: Int) {
        favoritesService.removeFromFavorites(productID: productID)
    }

}
