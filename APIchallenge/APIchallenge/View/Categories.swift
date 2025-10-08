//
//  Categories.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 14/08/25.
//

import SwiftUI

struct Categories: View {

    @Bindable var viewModel: CategoriesViewModel

    var topCategories: [Category]? {
        if viewModel.categories.isEmpty { return nil }
        return Array(filteredCategories.prefix(4))
    }

    var filteredCategories: [Category] {
        if viewModel.searchText.isEmpty {
            return viewModel.categories
        } else {
            return viewModel.categories.filter {
                $0.stringValue.lowercased().contains(viewModel.searchText.lowercased())
            }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            SearchBar(searchText: $viewModel.searchText)

            if let topCategories {
                HStack {
                    ForEach(topCategories) { category in
                        CategoryIcon(category: category)
                    }
                }

                List(filteredCategories) { category in
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
