//
//  Orders.swift
//  APIchallenge
//
//  Created by Bárbara Dapper on 15/08/25.
//
import SwiftUI
import SwiftData

struct Orders: View {
    
    var viewModel: ViewModelProtocol

    var orderList: [OrderList] {
        viewModel.orderList
    }
    
    @State var searchText: String = ""
    
    var orders: [Product] {
        orderList.compactMap {
            viewModel.products[$0.id]
        }
    }
    
    var searchedProducts: [Product] {
        if searchText.isEmpty {
            return orders
        }

        return orders.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchText)
            
            if orders.isEmpty {
                EmptyStateOrders()
                    .padding(.top, 156)
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(searchedProducts, id: \.id) { product in
                        OrderCard(product: product)
                    }
                }
                .padding(16)
            }
        }
        .navigationTitle("Orders")
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .toolbarBackground(.backgroundsTertiary, for: .tabBar)
    }
}

