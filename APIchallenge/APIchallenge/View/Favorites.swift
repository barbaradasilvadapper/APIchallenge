import SwiftData
//
//  Favorites.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//
import SwiftUI

struct Favorites: View {

    @Bindable var viewModel: FavoritesViewModel

    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchText)

            if viewModel.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {

                if viewModel.favorites.isEmpty {
                    EmptyStateFavorites()
                        .padding(.top, 156)
                }

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.searchedProducts, id: \.id) { product in
                            ProductListCart(
                                onFavoriteClick: {
                                    viewModel.addToFavorites(
                                        productID: product.id
                                    )
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
        }
        .navigationTitle("Favorites")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
        .onAppear {
            viewModel.list = viewModel.favoritesList
        }
        .task {
            if !viewModel.hasLoaded {
                await viewModel.fetch()
                viewModel.hasLoaded = true
            }
        }
    }
}
