//
//  Categories.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 14/08/25.
//

import SwiftUI

struct Categories: View {

    @State var searchText: String = ""

    let viewModel: any ViewModelProtocol

    var topCategories: [Category]? {
        if viewModel.categories.isEmpty { return nil }
        return Array(filteredCategories.prefix(4))
    }
    
    var filteredCategories: [Category] {
        if searchText.isEmpty {
            return viewModel.categories
        } else {
            return viewModel.categories.filter {
                $0.stringValue.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            SearchBar(searchText: $searchText)

            if let topCategories {
                HStack {
                    ForEach(topCategories) { category in
                        CategoryIcon(category: category)
                    }
                }
            } else {
                Text("Failed to load categories")
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
        }
        .navigationTitle("Categories")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
    }
}

#Preview {
    Categories(viewModel: ViewModel(service: APIService(), dataSource: SwiftDataService()))
}
