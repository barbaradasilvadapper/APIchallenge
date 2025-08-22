//
//  TabBar.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI

struct TabBar: View {
    
    let apiService = APIService()
    let favoritesService = FavoritesService()
    let cartService = CartService()
    let orderService = OrdersService()
    
    let homeViewModel = HomeViewModel(APIservice: APIService(), favoritesService: FavoritesService(), cartService: CartService())
    
    let categoriesViewModel = CategoriesViewModel(APIservice: APIService(), favoritesService: FavoritesService(), cartService: CartService())
    
    let cartViewModel = CartViewModel(APIservice: APIService(), favoritesService: FavoritesService(), cartService: CartService(), orderService: OrdersService())
    
    let favoritesViewModel = FavoritesViewModel(APIservice: APIService(), favoritesService: FavoritesService(), cartService: CartService())
    
    let orderViewModel = OrderViewModel(APIservice: APIService(), orderService: OrdersService())
    
    var body: some View {
        TabView {
            NavigationStack {
                Home(viewModel: homeViewModel)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationStack {
                Categories(viewModel: categoriesViewModel)
            }
            .tabItem {
                Label("Categories", systemImage: "square.grid.2x2")
            }
            
            NavigationStack {
                Cart(viewModel: cartViewModel)
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
            
            NavigationStack {
                Favorites(viewModel: favoritesViewModel)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
            
            NavigationStack {
                Orders(viewModel: orderViewModel)
            }
            .tabItem {
                Label("Orders", systemImage: "bag")
            }
        }
    }
}

#Preview {
    TabBar()
}
