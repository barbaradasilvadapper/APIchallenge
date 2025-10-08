import SwiftData
//
//  Orders.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//
import SwiftUI

struct Orders: View {

    @Bindable var viewModel: OrderViewModel

    var body: some View {
        VStack {
            SearchBar(searchText: $viewModel.searchText)

            if viewModel.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {

                if viewModel.orders.isEmpty {
                    EmptyStateOrders()
                        .padding(.top, 156)
                }

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.searchedProducts, id: \.id) { product in
                            OrderCard(product: product)
                        }
                    }
                    .padding(16)
                }
            }
        }
        .navigationTitle("Orders")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
        .onAppear {
            viewModel.list = viewModel.orderList
        }
        .task {
            if !viewModel.hasLoaded {
                await viewModel.fetch()
                viewModel.hasLoaded = true
            }
        }
    }
}
