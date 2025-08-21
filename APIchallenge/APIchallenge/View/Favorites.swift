//
//  Favorites.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//
import SwiftUI
import SwiftData

struct Favorites: View {
    
    var viewModel: ViewModelProtocol

    var favoritesList: [FavoritesList] {
        viewModel.favoritesList
    }
    
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
                        ProductListCart(viewModel: viewModel, product: product)
                    }
                }
                .padding(16)
            }
        }
        .navigationTitle("Favorites")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
    }
}

#Preview {
    NavigationStack { Favorites(viewModel: ViewModel(APIservice: APIService(), dataSource: SwiftDataService()))
    }
}
