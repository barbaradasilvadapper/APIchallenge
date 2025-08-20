//
//  CategoryFilter.swift
//  APIchallenge
//
//  Created by João Pedro Teixeira de Carvalho on 15/08/25.
//

import SwiftUI

struct CategoryFilter: View {

    var category: Category

    var viewModel: any ViewModelProtocol

    @State var searchText: String = ""
    @State var selectedProduct: Product? = nil

    var filteredProducts: [Product] {
        let products = viewModel.products.values
        return Array(products).filter { product in
            product.category == category
        }
    }
    
    var searchedProducts: [Product] {
        let products = filteredProducts
        if searchText.isEmpty {
            return Array(products)
        }

        return products.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }

    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]

    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            Divider()
                .frame(height: 1)
                .padding(.vertical, 16)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(searchedProducts) {
                        product in
                        Button {
                            selectedProduct = product
                        } label: {
                            VerticalProductCard(
                                viewModel: viewModel,
                                width: 177,
                                height: 250,
                                product: product
                            )
                        }
                    }
                }
                .sheet(item: $selectedProduct) { product in
                    NavigationStack {
                        Details(viewModel: viewModel, product: product)
                            .presentationDragIndicator(.visible)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle(category.stringValue.capitalized)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CategoryFilter(
            category: .beauty,
            viewModel: ViewModel(APIservice: APIService(), dataSource: SwiftDataService())
        )
    }
}
