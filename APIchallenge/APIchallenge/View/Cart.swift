//
//  Cart.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//

import SwiftData
import SwiftUI

struct Cart: View {
    @Bindable var viewModel: CartViewModel

    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchText)

            if viewModel.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                if viewModel.cart.isEmpty {
                    EmptyStateCart()
                        .padding(.top, 156)

                    Spacer()
                } else {

                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.searchedProducts, id: \.id) { product in
                                ProductCounter(
                                    add: {
                                        let qtd = viewModel.list.filter {
                                            $0.id == product.id
                                        }.first!.quantity
                                        if qtd < 9 {
                                            viewModel.list.filter {
                                                $0.id == product.id
                                            }.first!.quantity += 1
                                        }
                                    },
                                    remove: {
                                        let qtd = viewModel.list.filter {
                                            $0.id == product.id
                                        }.first!.quantity
                                        if qtd > 1 {
                                            viewModel.list.filter {
                                                $0.id == product.id
                                            }.first!.quantity -= 1
                                        } else {
                                            viewModel.removeFromCart(
                                                productID: product.id,
                                                quantity: qtd
                                            )
                                            viewModel.refreshID = UUID()
                                        }
                                    },
                                    product: product,
                                    quantity: viewModel.list.filter {
                                        $0.id == product.id
                                    }.first!.quantity
                                )
                            }
                        }
                        .padding(16)
                    }

                    Spacer()

                    VStack(spacing: 16) {

                        HStack {
                            Text("Total")
                                .font(.subheadline)

                            Spacer()

                            Text("US$ \(String(format: "%.2f", viewModel.total))")
                                .font(.headline)
                        }

                        Button {
                            viewModel.list.forEach { product in
                                viewModel.addToOrder(productID: product.id)
                            }
                            viewModel.clearCart()
                            viewModel.refreshID = UUID()
                        } label: {
                            Text("Checkout")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundStyle(.labelsPrimary)
                                .padding(.vertical, 16)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundStyle(.fillsTertiary)
                                )
                        }
                    }
                    .padding(16)

                }
            }
        }
        .accessibilityElement(children: .contain)
        .navigationTitle("Cart")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
        .onAppear {
            viewModel.list = viewModel.cartList
        }
        .task {
            if !viewModel.hasLoaded {
                await viewModel.fetch()
                viewModel.hasLoaded = true
            }
        }
        .id(viewModel.refreshID)
    }
}

//#Preview {
//    NavigationStack { Cart(viewModel: ViewModel(APIservice: APIService(), dataSource: SwiftDataService())) }
//}
