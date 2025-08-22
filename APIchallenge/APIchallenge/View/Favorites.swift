import SwiftData
//
//  Favorites.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//
import SwiftUI

struct Favorites: View {

    var viewModel: any FavoritesViewModelProtocol
    
    @State var hasLoaded: Bool = false

    @State var favoritesList: [FavoritesList] = []

    @State var searchText: String = ""

    var favorites: [Product] {
        favoritesList.compactMap {
            viewModel.products[$0.id]
        }
    }

    var searchedProducts: [Product] {
        if searchText.isEmpty {
            return favorites
        }

        return favorites.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)

            if favorites.isEmpty {
                EmptyStateFavorites()
                    .padding(.top, 156)
            }

            ScrollView {
                VStack(spacing: 16) {
                    ForEach(searchedProducts, id: \.id) { product in
                        ProductListCart(
                            onFavoriteClick: {
                                viewModel.addToFavorites(productID: product.id)
                            },
                            onCartClick: {
                                viewModel.addToCart(productID: product.id)
                            },
                            product: product
                        )
                    }
                }
                .padding(16)
            }
        }
        .navigationTitle("Favorites")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
        .onAppear {
            favoritesList = viewModel.favoritesList
        }
        .task {
            if !hasLoaded {
                await viewModel.fetch()
                hasLoaded = true
            }
        }
    }
}
