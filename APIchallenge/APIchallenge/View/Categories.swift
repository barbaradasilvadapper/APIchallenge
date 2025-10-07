//
//  Categories.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 14/08/25.
//

import SwiftUI

struct Categories: View {

    @Bindable var viewModel: CategoriesViewModel

    var body: some View {
        VStack(spacing: 16) {
            SearchBar(searchText: $viewModel.searchText)

            if let top = viewModel.topCategories {
                HStack {
                    ForEach(top) { category in
                        CategoryIcon(category: category)
                    }
                }

                List(viewModel.filteredCategories) { category in
                    NavigationLink {
                        CategoryFilter(category: category, viewModel: viewModel)
                    } label: {
                        Text(category.stringLocalized.capitalized)
                    }

                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)

                Spacer()

            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
        .navigationTitle("Categories")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
        .task {
            if !viewModel.hasLoaded {
                await viewModel.fetch()
                viewModel.hasLoaded = true
            }
        }
    }
}

//#Preview {
//    Categories(viewModel: ViewModel(APIservice: APIService(), dataSource: SwiftDataService(), favoritesService: FavoritesService(), cartService: CartService()))
//}
