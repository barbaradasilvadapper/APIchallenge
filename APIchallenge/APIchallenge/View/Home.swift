//
//  Home.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 14/08/25.
//

import SwiftUI

struct Home: View {

    @Bindable var viewModel: HomeViewModel

    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]

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
    /***/

    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else {

                ViewThatFits {

                    // Horizontal iPad
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Deals of the Day")
                            .font(.title2).fontWeight(.bold)
                        if let deals = viewModel.iPadDealsOfTheDay {
                            LazyVGrid(
                                columns: iPadDealsOfTheDayColumns,
                                spacing: 0
                            ) {
                                ForEach(deals) { product in
                                    Button {
                                        viewModel.selectedProduct = product
                                    } label: {
                                        ProductCard(
                                            onClick: {
                                                toggleFavorites(product)
                                            },
                                            height: 255,
                                            product: product
                                        )
                                    }
                                }
                            }
                            .sheet(item: $viewModel.selectedProduct) { product in
                                NavigationStack {
                                    Details(
                                        onFavoriteClick: {
                                            viewModel.addToFavorites(
                                                productID: product.id
                                            )
                                        },
                                        onCartClick: {
                                            viewModel.addToCart(
                                                productID: product.id
                                            )
                                        },
                                        product: product
                                    )
                                    .presentationDragIndicator(.visible)
                                }
                            }
                        }

                        VStack(alignment: .leading) {
                            Text("Top picks")
                                .font(.title2).fontWeight(.bold)

                            LazyVGrid(
                                columns: iPadHorizontalColumns,
                                spacing: 16
                            ) {
                                ForEach(
                                    Array(
                                        viewModel.products.values.sorted {
                                            $0.title < $1.title
                                        }
                                    ),
                                    id: \.self
                                ) { product in
                                    Button {
                                        viewModel.selectedProduct = product
                                    } label: {
                                        VerticalProductCard(
                                            onClick: {
                                                toggleFavorites(product)
                                            },
                                            width: 214,
                                            height: 302,
                                            product: product
                                        )
                                    }
                                }
                            }
                            .sheet(item: $viewModel.selectedProduct) { product in
                                NavigationStack {
                                    Details(
                                        onFavoriteClick: {
                                            viewModel.addToFavorites(
                                                productID: product.id
                                            )
                                        },
                                        onCartClick: {
                                            viewModel.addToCart(
                                                productID: product.id
                                            )
                                        },
                                        product: product
                                    )
                                    .presentationDragIndicator(.visible)
                                }
                            }

                        }
                    }

                    // Wide (iPad) layout
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Deals of the Day")
                            .font(.title2).fontWeight(.bold)
                        if let deals = viewModel.iPadDealsOfTheDay {
                            LazyVGrid(
                                columns: iPadDealsOfTheDayColumns,
                                spacing: 0
                            ) {
                                ForEach(deals) { product in
                                    Button {
                                        viewModel.selectedProduct = product
                                    } label: {
                                        ProductCard(
                                            onClick: {
                                                toggleFavorites(product)
                                            },
                                            height: 167,
                                            product: product
                                        )
                                    }
                                }
                            }
                            .sheet(item: $viewModel.selectedProduct) { product in
                                NavigationStack {
                                    Details(
                                        onFavoriteClick: {
                                            viewModel.addToFavorites(
                                                productID: product.id
                                            )
                                        },
                                        onCartClick: {
                                            viewModel.addToCart(
                                                productID: product.id
                                            )
                                        },
                                        product: product
                                    )
                                    .presentationDragIndicator(.visible)
                                }
                            }
                        }

                        VStack(alignment: .leading) {
                            Text("Top picks")
                                .font(.title2).fontWeight(.bold)
                            LazyVGrid(columns: iPadColumns, spacing: 16) {
                                ForEach(
                                    viewModel.iPadTopPicks,
                                    id: \.self
                                ) { product in
                                    Button {
                                        viewModel.selectedProduct = product
                                    } label: {
                                        VerticalProductCard(
                                            onClick: {
                                                toggleFavorites(product)
                                            },
                                            width: 181,
                                            height: 256,
                                            product: product
                                        )
                                    }
                                }
                            }
                            .sheet(item: $viewModel.selectedProduct) { product in
                                NavigationStack {
                                    Details(
                                        onFavoriteClick: {
                                            viewModel.addToFavorites(
                                                productID: product.id
                                            )
                                        },
                                        onCartClick: {
                                            viewModel.addToCart(
                                                productID: product.id
                                            )
                                        },
                                        product: product
                                    )
                                    .presentationDragIndicator(.visible)
                                }
                            }
                        }

                        VStack(alignment: .leading) {
                            Text("Best Sellers")
                                .font(.title2).fontWeight(.bold)
                            if let bestSellers = viewModel.iPadBestSellers {
                                LazyVGrid(columns: iPadColumns, spacing: 16) {
                                    ForEach(
                                        bestSellers,
                                        id: \.self
                                    ) { product in
                                        Button {
                                            viewModel.selectedProduct = product
                                        } label: {
                                            VerticalProductCard(
                                                onClick: {
                                                    toggleFavorites(product)
                                                },
                                                width: 181,
                                                height: 256,
                                                product: product
                                            )
                                        }
                                    }
                                }
                                .sheet(item: $viewModel.selectedProduct) { product in
                                    NavigationStack {
                                        Details(
                                            onFavoriteClick: {
                                                viewModel.addToFavorites(
                                                    productID: product.id
                                                )
                                            },
                                            onCartClick: {
                                                viewModel.addToCart(
                                                    productID: product.id
                                                )
                                            },
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
                        if let deal = viewModel.dealOfTheDay {
                            Button {
                                viewModel.selectedProduct = deal
                            } label: {
                                ProductCard(
                                    onClick: { toggleFavorites(deal) },
                                    height: 160,
                                    product: deal
                                )
                            }
                            .sheet(item: $viewModel.selectedProduct) { product in
                                NavigationStack {
                                    Details(
                                        onFavoriteClick: {
                                            viewModel.addToFavorites(
                                                productID: product.id
                                            )
                                        },
                                        onCartClick: {
                                            viewModel.addToCart(
                                                productID: product.id
                                            )
                                        },
                                        product: product
                                    )
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
                                    viewModel.selectedProduct = product
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
                        .sheet(item: $viewModel.selectedProduct) { product in
                            NavigationStack {
                                Details(
                                    onFavoriteClick: {
                                        viewModel.addToFavorites(
                                            productID: product.id
                                        )
                                    },
                                    onCartClick: {
                                        viewModel.addToCart(
                                            productID: product.id
                                        )
                                    },
                                    product: product
                                )
                                .presentationDragIndicator(.visible)
                            }
                        }
                    }
                }
            }

        }
        .padding(.horizontal, 8)
        .padding(.vertical, 16)
        .onAppear {
            if !viewModel.hasAppeared {
                viewModel.hasAppeared = true

                Task {
                    await viewModel.fetch()
                }
            }
        }
        .navigationTitle("Home")
    }

    private func toggleFavorites(_ product: Product) {
        viewModel.addToFavorites(productID: product.id)
    }
}
