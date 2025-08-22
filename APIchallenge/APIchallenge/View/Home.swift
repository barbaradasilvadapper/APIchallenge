//
//  Home.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI

struct Home: View {

    var viewModel: any ViewModelProtocol
    var dealOfTheDay: Product? {
        viewModel.products.values.first
    }

    @State var selectedProduct: Product?
    @State var hasAppeared: Bool = false

    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]

    /* iPad vars */
    var iPadDealsOfTheDay: [Product]? {
        Array(viewModel.products.values.prefix(2))
    }

    let iPadDealsOfTheDayColumns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    let iPadColumns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]

    let iPadHorizontalColumns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
    ]

    var iPadTopPicks: [Product] {
        Array(
            viewModel.products.values.sorted { $0.title < $1.title }.prefix(4)
        )
    }

    var iPadBestSellers: [Product]? {
        Array(
            viewModel.products.values.sorted { $0.title > $1.title }.dropFirst(
                4
            )
        )
    }
    /***/

    var body: some View {
        ScrollView {
            ViewThatFits {

                // Horizontal iPad
                VStack(alignment: .leading, spacing: 16) {
                    if let deals = iPadDealsOfTheDay {
                        LazyVGrid(columns: iPadDealsOfTheDayColumns, spacing: 0)
                        {
                            ForEach(deals) { product in
                                Button {
                                    selectedProduct = product
                                } label: {
                                    ProductCard(
                                        onClick: { toggleFavorites(product) },
                                        height: 255,
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

                    VStack(alignment: .leading) {
                        Text("Top picks")
                            .font(.title2).fontWeight(.bold)

                        LazyVGrid(columns: iPadHorizontalColumns, spacing: 16) {
                            ForEach(
                                Array(
                                    viewModel.products.values.sorted {
                                        $0.title < $1.title
                                    }
                                ),
                                id: \.self
                            ) { product in
                                Button {
                                    selectedProduct = product
                                } label: {
                                    VerticalProductCard(
                                        onClick: { toggleFavorites(product) },
                                        width: 214,
                                        height: 302,
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
                }

                // Wide (iPad) layout
                VStack(alignment: .leading, spacing: 16) {
                    if let deals = iPadDealsOfTheDay {
                        LazyVGrid(columns: iPadDealsOfTheDayColumns, spacing: 0)
                        {
                            ForEach(deals) { product in
                                Button {
                                    selectedProduct = product
                                } label: {
                                    ProductCard(
                                        onClick: { toggleFavorites(product) },
                                        height: 167,
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

                    VStack(alignment: .leading) {
                        Text("Top picks")
                            .font(.title2).fontWeight(.bold)
                        LazyVGrid(columns: iPadColumns, spacing: 16) {
                            ForEach(
                                iPadTopPicks,
                                id: \.self
                            ) { product in
                                Button {
                                    selectedProduct = product
                                } label: {
                                    VerticalProductCard(
                                        onClick: { toggleFavorites(product) },
                                        width: 181,
                                        height: 256,
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

                    VStack(alignment: .leading) {
                        Text("Best Sellers")
                            .font(.title2).fontWeight(.bold)
                        if let bestSellers = iPadBestSellers {
                            LazyVGrid(columns: iPadColumns, spacing: 16) {
                                ForEach(
                                    bestSellers,
                                    id: \.self
                                ) { product in
                                    Button {
                                        selectedProduct = product
                                    } label: {
                                        VerticalProductCard(
                                            onClick: { toggleFavorites(product) },
                                            width: 181,
                                            height: 256,
                                            product: product
                                        )
                                    }
                                }
                            }
                            .sheet(item: $selectedProduct) { product in
                                NavigationStack {
                                    Details(
                                        viewModel: viewModel,
                                        product: product
                                    )
                                    .presentationDragIndicator(.visible)
                                }
                            }
                        }
                    }
                }

                // Fallback (iPhone vertical stack)
                VStack(alignment: .leading, spacing: 16) {
                    Text("Deals of the Day")
                        .font(.title2).fontWeight(.bold)
                    if let deal = dealOfTheDay {
                        Button {
                            selectedProduct = deal
                        } label: {
                            ProductCard(onClick: { toggleFavorites(deal) }, height: 160, product: deal)
                        }
                        .sheet(item: $selectedProduct) { product in
                            NavigationStack {
                                Details(viewModel: viewModel, product: product)
                                    .presentationDragIndicator(.visible)
                            }
                        }
                    }

                    Text("Top picks")
                        .font(.title2).fontWeight(.bold)
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(
                            Array(
                                viewModel.products.values.sorted(by: {
                                    $0.title < $1.title
                                })
                            ),
                            id: \.self
                        ) { product in
                            Button {
                                selectedProduct = product
                            } label: {
                                VerticalProductCard(
                                    onClick: { toggleFavorites(product) },
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
            }

        }
        .padding(16)
        .onAppear {
            if !hasAppeared {
                hasAppeared = true

                Task {
                    await viewModel.fetch()
                }
            }
        }
        .navigationTitle("Home")
    }
    
    private func toggleFavorites(_ product: Product) {
        viewModel.addToFavorites(productID: product.id)
        print(viewModel.products[product.id]?.isFavourite)
    }
}

//#Preview {
//    NavigationStack {
//        Home(
//            viewModel: ViewModel(
//                APIservice: APIService(),
//                dataSource: SwiftDataService()
//            )
//        )
//    }
//}
