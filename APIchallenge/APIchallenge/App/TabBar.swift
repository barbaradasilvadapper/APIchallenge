//
//  TabBar.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI

struct TabBar: View {
    
    let vm: ViewModelProtocol = ViewModel(APIservice: APIService(), dataSource: SwiftDataService(), favoritesService: FavoritesService(), cartService: CartService())
    
    var body: some View {
        TabView {
            NavigationStack {
                Home(viewModel: vm)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationStack {
                Categories(viewModel: vm)
            }
            .tabItem {
                Label("Categories", systemImage: "square.grid.2x2")
            }
            
            NavigationStack {
                Cart(viewModel: vm)
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
            
            NavigationStack {
                Favorites(viewModel: vm)
            }
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
            
            NavigationStack {
                Orders(viewModel: vm)
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
